Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3729A1
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695224308; x=1726760308;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4gyXCBnrlqcGMYoIWPbjV5wf9sCClHXyno5V82uj9AQ=;
  b=d/e41QOeshUtDUTVnIpyPvO3ZvqEWlYy5OQEzLMyJrL6sqp9OVMwpUak
   9Qyw5A7BS6NDMBLwZAeZ88xd7NPdMisi9lT5snseA7+dFxVzFYA4SoePL
   mCFY23JL1BUqYbGF98w6FnNUD8iC6WF57uqifaC04jxtQbmiq5H+dGWJ+
   eb70LNIXSxXBsYsupqi4VmK4f9FECq3JrL9dMJtDFvq3Z60/cHXrMzddd
   krddtktGhADRySmOG3WiFUvqTcC228nD+a0rcId9UZpr1cidk74F9oNDV
   eMqLoHzFDQGKqlub0fIji+BpHQSoWi/rEle0hlWCqnTP29pUwAmD2je4q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370569826"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="370569826"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077485504"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="1077485504"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 08:38:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ABFA671B; Wed, 20 Sep 2023 18:38:22 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	llvm@lists.linux.dev,
	alsa-devel@alsa-project.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v1 1/1] device property: Replace custom implementation of COUNT_ARGS()
Date: Wed, 20 Sep 2023 18:38:19 +0300
Message-Id: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom and non-portable implementation of COUNT_ARGS().

Fixes: e64b674bc9d7 ("software node: implement reference properties")
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/property.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 1684fca930f7..55c2692ffa8c 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -10,6 +10,7 @@
 #ifndef _LINUX_PROPERTY_H_
 #define _LINUX_PROPERTY_H_
 
+#include <linux/args.h>
 #include <linux/bits.h>
 #include <linux/fwnode.h>
 #include <linux/stddef.h>
@@ -314,7 +315,7 @@ struct software_node_ref_args {
 #define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
 (const struct software_node_ref_args) {				\
 	.node = _ref_,						\
-	.nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,	\
+	.nargs = COUNT_ARGS(__VA_ARGS__),			\
 	.args = { __VA_ARGS__ },				\
 }
 
-- 
2.40.0.1.gaa8946217a0b

