'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "060a2d8fddd838f575dc7a112813e591",
"assets/AssetManifest.bin.json": "e37b82ce86303774797aa5d3c46180e6",
"assets/AssetManifest.json": "b4439ac6ab107a32f5001696a8eaf9fa",
"assets/assets/icon/app_icon.png": "00de61e08e998ff61ec7522db208a789",
"assets/assets/images/affogato.jpg": "7cdf95d5bb0238de2678a81535fa6963",
"assets/assets/images/american.jpg": "192601a5f663fff1ce63f1717b322da3",
"assets/assets/images/banner.jpg": "bb9858c213f4d7a002db7750c666c0e3",
"assets/assets/images/bombon.jpg": "f063388ccdba158d5ebf3ecca12d79e1",
"assets/assets/images/cafe%2520con%2520leche.jpg": "140737c18b159f956bc0723c56175fa1",
"assets/assets/images/cafe.jpg": "73f35bcee907712adbf93146fd99c777",
"assets/assets/images/cappuccino.jpg": "6352959959e49ad628fef0768fb66388",
"assets/assets/images/cinnamon%2520sugar%2520latte.jpg": "eb77d90e021c316252f072e22e5e8cd6",
"assets/assets/images/cinnamon%2520sugar%2520mocha.jpg": "014cf0970a74b97ca0dd68deabd6365d",
"assets/assets/images/cleo.jpg": "8c23875396248344aeacd6b97955dfea",
"assets/assets/images/cold%2520brew.jpg": "730822b821e6d9b9950b44914a45b018",
"assets/assets/images/cortado.webp": "fe522e0b7b4c5523bfcec2a071910aac",
"assets/assets/images/espresso.jpg": "d906259f18edf2c9bb776288af1e1bbf",
"assets/assets/images/flat%2520white.jpg": "1248c7ea2ce4f32ca5e92acf1f5f9e65",
"assets/assets/images/fondo.jpg": "8d41d53c63b5216e0e682086b0705cda",
"assets/assets/images/iced%2520americano.jpg": "f3905be98872a72e1a28ae625198ca0d",
"assets/assets/images/iced%2520latte.jpg": "f5006a689c7991fed6fc1faf36e515cb",
"assets/assets/images/interior.jpg": "4f1b4c2ce99cb15d737dcde4645ac774",
"assets/assets/images/irish.jpg": "74f6dcea80288829a0959885bdbdd365",
"assets/assets/images/latte.jpg": "e6d580c59efeee2b21e4ac67c2afc8ee",
"assets/assets/images/local.jpg": "39cd67f2a4f04099fec6f9f5858a37b7",
"assets/assets/images/luna.jpg": "f2d0c4066c279aa0bf3c1f2715442ef8",
"assets/assets/images/lungo.jpg": "83244a225f6a4c0e6952959f695392e4",
"assets/assets/images/macchiato.jpg": "3bdb1f0fbb1ef96373b3b75629ebac18",
"assets/assets/images/mocha.jpg": "79c0a9042d8ce56f73f8a4e93a0effd0",
"assets/assets/images/oliver.jpg": "75bb2c6bed2f53b0134dbbf4b80b00cc",
"assets/assets/images/ristretto.jpg": "079064a3ee8ba5ed37962b653eef2b4f",
"assets/assets/images/simba.jpg": "0991b126b05e7fe9c6ebb4a90ca05379",
"assets/assets/images/todos.jpg": "44930cbe7730484a1380329452a0f0c4",
"assets/assets/images/vienes.jpg": "8565b3dc75ac873285c0676d08729062",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "5f81b67e079a24efa038519d5211ed95",
"assets/NOTICES": "d315c82c97525eba96ce6267ecdec559",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "06d71888c0fa417016a17d3b1d8965e6",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "9646fb7aa8326024033679f0904257da",
"icons/Icon-192.png": "7008a60f78911cb14b16f911e71218a9",
"icons/Icon-512.png": "706b094f0b2c891707f38ce466075c30",
"icons/Icon-maskable-192.png": "7008a60f78911cb14b16f911e71218a9",
"icons/Icon-maskable-512.png": "706b094f0b2c891707f38ce466075c30",
"index.html": "aeb9c664065a67e17ada6361c6a5685d",
"/": "aeb9c664065a67e17ada6361c6a5685d",
"main.dart.js": "397fbf5f1026e92bc5bd253b11106159",
"manifest.json": "e67bae4fdb7f6e65c3e9dffeab659572",
"version.json": "c8e59dd28f7abb759ecfc5b79d4f7e50"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
