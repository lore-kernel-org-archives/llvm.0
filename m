Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0714B1B75
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647330443; x=1678866443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=quiUqKlBf7DYFz3VVEXbltIrZqTg2LO5WwsAXib9Hnk=;
  b=fAIC7XZt7O7ozLQJ+Zh+fCSmOWE8WP5HsDG5OgUHwKykQLJQZfACG7NA
   mg04w1kwrZgU4vsIL/cSwE+qj2/gnd4GjC4w/hn/NbPbHKuFxURA/6J6d
   AXQUaHL2pkwHkultgjx7fKzxWguICq390CcBaU46iuZc2ZH8zDARGPsMG
   6X9k0fY8iGkC1KryTAHMpk3rrrc5k2b6uM/8K1NPkNiWCW6wZdLemI0X+
   XUbybirJlgGE9EFWsaG4kGVXqsHlBH/93onmPWXVDu7ArDB9MTTSo05Lh
   P8krBHvoIjZ76GKn/1OogiDctDkO2ocnpzFw2xOBS79V6R40pzc88z24b
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238404814"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="238404814"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 00:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="540325193"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2022 00:47:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nU1tf-000AhV-ER; Tue, 15 Mar 2022 07:47:11 +0000
Date: Tue, 15 Mar 2022 15:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Haowen Bai <baihaowen@meizu.com>, freude@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	Haowen Bai <baihaowen@meizu.com>
Subject: Re: [PATCH] s390: crypto: Use min() instead of doing it manually
Message-ID: <202203151545.3poQ7F02-lkp@intel.com>
References: <1647311321-26303-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647311321-26303-1-git-send-email-baihaowen@meizu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Haowen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on s390/features]
[also build test WARNING on v5.17-rc8 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Haowen-Bai/s390-crypto-Use-min-instead-of-doing-it-manually/20220315-103027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: s390-randconfig-r044-20220314 (https://download.01.org/0day-ci/archive/20220315/202203151545.3poQ7F02-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/7d8807f03eff8ba4f49bf809d565da740a8ab11e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Haowen-Bai/s390-crypto-Use-min-instead-of-doing-it-manually/20220315-103027
        git checkout 7d8807f03eff8ba4f49bf809d565da740a8ab11e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/s390/crypto/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/s390/crypto/zcrypt_ep11misc.c:20:
   In file included from drivers/s390/crypto/ap_bus.h:20:
   In file included from arch/s390/include/asm/ap.h:15:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/s390/crypto/zcrypt_ep11misc.c:20:
   In file included from drivers/s390/crypto/ap_bus.h:20:
   In file included from arch/s390/include/asm/ap.h:15:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/s390/crypto/zcrypt_ep11misc.c:20:
   In file included from drivers/s390/crypto/ap_bus.h:20:
   In file included from arch/s390/include/asm/ap.h:15:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/s390/crypto/zcrypt_ep11misc.c:1112:13: warning: comparison of distinct pointer types ('typeof (kb->head.len) *' (aka 'unsigned short *') and 'typeof (keysize) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   keysize = min(kb->head.len, keysize);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   13 warnings generated.


vim +1112 drivers/s390/crypto/zcrypt_ep11misc.c

  1067	
  1068	static int ep11_wrapkey(u16 card, u16 domain,
  1069				const u8 *key, size_t keysize,
  1070				u32 mech, const u8 *iv,
  1071				u8 *databuf, size_t *datasize)
  1072	{
  1073		struct wk_req_pl {
  1074			struct pl_head head;
  1075			u8  var_tag;
  1076			u8  var_len;
  1077			u32 var;
  1078			u8  mech_tag;
  1079			u8  mech_len;
  1080			u32 mech;
  1081			/*
  1082			 * followed by iv data
  1083			 * followed by key tag + key blob
  1084			 * followed by dummy kek param
  1085			 * followed by dummy mac param
  1086			 */
  1087		} __packed * req_pl;
  1088		struct wk_rep_pl {
  1089			struct pl_head head;
  1090			u8  rc_tag;
  1091			u8  rc_len;
  1092			u32 rc;
  1093			u8  data_tag;
  1094			u8  data_lenfmt;
  1095			u16 data_len;
  1096			u8  data[1024];
  1097		} __packed * rep_pl;
  1098		struct ep11_cprb *req = NULL, *rep = NULL;
  1099		struct ep11_target_dev target;
  1100		struct ep11_urb *urb = NULL;
  1101		struct ep11keyblob *kb;
  1102		size_t req_pl_size;
  1103		int api, rc = -ENOMEM;
  1104		bool has_header = false;
  1105		u8 *p;
  1106	
  1107		/* maybe the session field holds a header with key info */
  1108		kb = (struct ep11keyblob *) key;
  1109		if (kb->head.type == TOKTYPE_NON_CCA &&
  1110		    kb->head.version == TOKVER_EP11_AES) {
  1111			has_header = true;
> 1112			keysize = min(kb->head.len, keysize);
  1113		}
  1114	
  1115		/* request cprb and payload */
  1116		req_pl_size = sizeof(struct wk_req_pl) + (iv ? 16 : 0)
  1117			+ ASN1TAGLEN(keysize) + 4;
  1118		req = alloc_cprb(req_pl_size);
  1119		if (!req)
  1120			goto out;
  1121		if (!mech || mech == 0x80060001)
  1122			req->flags |= 0x20; /* CPACF_WRAP needs special bit */
  1123		req_pl = (struct wk_req_pl *) (((u8 *) req) + sizeof(*req));
  1124		api = (!mech || mech == 0x80060001) ? 4 : 1; /* CKM_IBM_CPACF_WRAP */
  1125		prep_head(&req_pl->head, req_pl_size, api, 33); /* WrapKey */
  1126		req_pl->var_tag = 0x04;
  1127		req_pl->var_len = sizeof(u32);
  1128		/* mech is mech + mech params (iv here) */
  1129		req_pl->mech_tag = 0x04;
  1130		req_pl->mech_len = sizeof(u32) + (iv ? 16 : 0);
  1131		req_pl->mech = (mech ? mech : 0x80060001); /* CKM_IBM_CPACF_WRAP */
  1132		p = ((u8 *) req_pl) + sizeof(*req_pl);
  1133		if (iv) {
  1134			memcpy(p, iv, 16);
  1135			p += 16;
  1136		}
  1137		/* key blob */
  1138		p += asn1tag_write(p, 0x04, key, keysize);
  1139		/* maybe the key argument needs the head data cleaned out */
  1140		if (has_header) {
  1141			kb = (struct ep11keyblob *)(p - keysize);
  1142			memset(&kb->head, 0, sizeof(kb->head));
  1143		}
  1144		/* empty kek tag */
  1145		*p++ = 0x04;
  1146		*p++ = 0;
  1147		/* empty mac tag */
  1148		*p++ = 0x04;
  1149		*p++ = 0;
  1150	
  1151		/* reply cprb and payload */
  1152		rep = alloc_cprb(sizeof(struct wk_rep_pl));
  1153		if (!rep)
  1154			goto out;
  1155		rep_pl = (struct wk_rep_pl *) (((u8 *) rep) + sizeof(*rep));
  1156	
  1157		/* urb and target */
  1158		urb = kmalloc(sizeof(struct ep11_urb), GFP_KERNEL);
  1159		if (!urb)
  1160			goto out;
  1161		target.ap_id = card;
  1162		target.dom_id = domain;
  1163		prep_urb(urb, &target, 1,
  1164			 req, sizeof(*req) + req_pl_size,
  1165			 rep, sizeof(*rep) + sizeof(*rep_pl));
  1166	
  1167		rc = zcrypt_send_ep11_cprb(urb);
  1168		if (rc) {
  1169			DEBUG_ERR(
  1170				"%s zcrypt_send_ep11_cprb(card=%d dom=%d) failed, rc=%d\n",
  1171				__func__, (int) card, (int) domain, rc);
  1172			goto out;
  1173		}
  1174	
  1175		rc = check_reply_pl((u8 *)rep_pl, __func__);
  1176		if (rc)
  1177			goto out;
  1178		if (rep_pl->data_tag != 0x04 || rep_pl->data_lenfmt != 0x82) {
  1179			DEBUG_ERR("%s unknown reply data format\n", __func__);
  1180			rc = -EIO;
  1181			goto out;
  1182		}
  1183		if (rep_pl->data_len > *datasize) {
  1184			DEBUG_ERR("%s mismatch reply data len / data buffer len\n",
  1185				  __func__);
  1186			rc = -ENOSPC;
  1187			goto out;
  1188		}
  1189	
  1190		/* copy the data from the cprb to the data buffer */
  1191		memcpy(databuf, rep_pl->data, rep_pl->data_len);
  1192		*datasize = rep_pl->data_len;
  1193	
  1194	out:
  1195		kfree(req);
  1196		kfree(rep);
  1197		kfree(urb);
  1198		return rc;
  1199	}
  1200	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
