'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "eeaed5f7a1a995649feb4b9d6941da6b",
"assets/assets/alerted.jpg": "089b5cdfa3ea4fc01842954747dad0d1",
"assets/assets/discussions.json": "b598379b9a56129ba4938d871e61d70b",
"assets/assets/dummy_profile_pic.jpg": "601cd845e41d07cad7f5e59e9e8ae280",
"assets/assets/greenticklottie.json": "324854e9301dc1edee1ccd87127d403d",
"assets/assets/json/contacts.json": "666c529a04cb483bbcbf785110a38c08",
"assets/assets/json/dummy_incident.json": "8b03ca1613f251992b4aa348163e2d07",
"assets/assets/logo.png": "75135c8eeb2f8351d7cc47eaba211f34",
"assets/assets/microphone.png": "2098981fed4a420595e1cecdd5fe7e91",
"assets/assets/redalertsent.jpg": "9cac2f176b0e292c5c7c646b59209324",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "f9f03a9bfdd62a203abb28ba9bf752f2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"favicon.ico": "ca4687af3c040487aebb6fc8694510bb",
"icons/android-icon-144x144.png": "e98c1a83e47d9b4aeead60b04f31f46a",
"icons/android-icon-192x192.png": "b294228528dce7cfd4d713ab93dff7b5",
"icons/android-icon-36x36.png": "33b5d486160760302ceb18e83f2fac74",
"icons/android-icon-48x48.png": "c580ae3c54037cdafffc6192c40d5fad",
"icons/android-icon-72x72.png": "b6e66160fa7f9a3db7b6cdec0a6f05a6",
"icons/android-icon-96x96.png": "a8b85eb32cd270890e10c6ed7483ce4c",
"icons/apple-icon-114x114.png": "c9c6aac9f7cb7dbda6ff5b7a95024949",
"icons/apple-icon-120x120.png": "85adaa797a796d1519bb6c80cee6fb93",
"icons/apple-icon-144x144.png": "e98c1a83e47d9b4aeead60b04f31f46a",
"icons/apple-icon-152x152.png": "debb21f17245af3550213e483f18e08c",
"icons/apple-icon-180x180.png": "984d741384729b9663356b360ae88090",
"icons/apple-icon-57x57.png": "1b504b893fe1f27d304f0c69d51170cc",
"icons/apple-icon-60x60.png": "2558c42b229d1ead8e1390345db99f83",
"icons/apple-icon-72x72.png": "b6e66160fa7f9a3db7b6cdec0a6f05a6",
"icons/apple-icon-76x76.png": "a93570d58287c12b1aa2f70d17678f57",
"icons/apple-icon-precomposed.png": "24e1d7be2516962cde778e706aa88bd6",
"icons/apple-icon.png": "24e1d7be2516962cde778e706aa88bd6",
"icons/favicon-16x16.png": "15990a2a3dd224eea47923921ea97507",
"icons/favicon-32x32.png": "fcd47d5fe3b98b480248a550e22d138e",
"icons/favicon-96x96.png": "a8b85eb32cd270890e10c6ed7483ce4c",
"icons/ms-icon-144x144.png": "e98c1a83e47d9b4aeead60b04f31f46a",
"icons/ms-icon-150x150.png": "4ee75e2ef2d3bc80bb9710734c5ba6d8",
"icons/ms-icon-310x310.png": "69a6c79b8abbdb0597b0a88de6c86cf1",
"icons/ms-icon-70x70.png": "7be7142efc5118d16772b7cee1fb8717",
"index.html": "95e9be04e65318b43c547076848d38b6",
"/": "95e9be04e65318b43c547076848d38b6",
"main.dart.js": "faa97fa6603e0583f20109be01a23510",
"manifest.json": "d9c9e436b5cae8d64d6c73103b815bd5",
"version.json": "5372ba427c3198ba505eed6a5d0ec7ea"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
