Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205513;
	b=maQFTlvy3X25nYYXTLX62Ot5sFPDZGi8/jr8Bk2fyaHwjnUHjJ/hl/nGa4YipH5UoWJO
	 3X9r8OAwln7w2Fg8X6qzDVf3mHcQ42nNgb+iXdNX5HJ7J9OHkl4Bs4KSrjYHevhymKDXp
	 RkBvxak2ZZ8SbK7+jJTpUwM8ekkRxe8Uc3Ds1KL8li8bY3iCxQJkdT7buO02bJw+6EhOU
	 j/awtGnom6TuupoeG54kqBZ7El4YPzBE7rj3WvpPMt3s9E97lGhQi13JgtxALQXQLKvKV
	 V1Pvc25InMZ9Vu6D8/JH9bE/1u4Cp3ygnzX/WT6kv0MUrWdDuuoQpi16BT4fYhog/gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205513;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=syyZAgghFB2yjz7QtPWEK++I+aqJL7nnvgK0Mbb84ng=;
	b=k1f28id4jwkX4N9Iywm/TBAj6Orv7L6jGu93Qq+yHAcZd8VcGROVKJ0hi1g8bbWLy2nz
	 OrKh9kU/GfVSvAoIiwylU6exGnkQp9CPzp7Mh53fGMthNm0yKxcoAzALB9U52colQNeye
	 0XhQjksrLQH3ZPMvBio/6bXsz9nid9NrvHa3f2C0BZYpOTsE3nH/2mS5k1E9nxGY3yCyY
	 TXfmzVxz+1T1c41Ygq5NU7KF8rdwDIE1EBxZyufldYestJQEvFU01dpsCLafYFY+glLXV
	 Qy5XwwxuGrVB8rE9exv/43KI1k5UgoGLSEWZmbm+Y9Nx1w5+a/RzFSMZkP+Mt4rDoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bq2och5C;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24B606A6CF;
	Fri, 20 Nov 2026 20:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE24B606A6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bq2och5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795205511; x=1826741511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lRCQ9KCfOnRrOzZOd8tvpwzEbJUwz8+OaC9XkgymjfQ=;
  b=bq2och5CbOt5tJkZblQQO7beFY/CobrsDFllopZZraur8ipX3xtiop3z
   If06HnpeUgQ0Lf7q1ksbaSlw7UU2sY/tCiyn27TdX5VX9iZ1lVbWIRqOn
   mHIS3Bi/qTPFn14ZZxgCMNttWMgfKfXHiXEOtwBkEbqRZlajTgG4jz1QC
   WUszg1P7WOD8JYrMFRPXqOaRlkgdB1Ysql2N3JGksvv0eOABVBB8+VMy2
   Q8WLTt4W7iW6Xwm3q9rPJxWv9FYq/4wKrpDuM99VXpv40Lv/aWkBF3i5P
   D/QsXgBnD+o/QVHhF8Pv88bMl7yq9AB8z5xXnvZFdnlw1sOFozEX/RFSA
   Q==;
X-CSE-ConnectionGUID: GBC+CdXwSJS4pYIrl5itFw==
X-CSE-MsgGUID: CjA4VTx9SKupyBRQV6noTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3974428"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3974428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:11:50 -0800
X-CSE-ConnectionGUID: /kkF4C2URWe94BSTH3GAQw==
X-CSE-MsgGUID: FsYu6pzwR4i9zVs7DyEr0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11042550"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2026 12:11:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUxU-00000001ISg-2ph0;
	Fri, 20 Nov 2026 20:11:44 +0000
Date: Sat, 21 Nov 2026 04:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] nvme-keyring: add 'dhchap' key type
Message-ID: <202611210348.KYpQPgoE-lkp@intel.com>
References: <20261120-dhchap-keyring-v4-v4-2-5f8c7d9926ee@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-dhchap-keyring-v4-v4-2-5f8c7d9926ee@kernel.org>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 68099cf27253a8c89d703a282d3d811446d9453b]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/nvme-auth-modify-nvme_auth_transform_key-to-return-status/20261120-121400
base:   68099cf27253a8c89d703a282d3d811446d9453b
patch link:    https://lore.kernel.org/r/20261120-dhchap-keyring-v4-v4-2-5f8c7d9926ee%40kernel.org
patch subject: [PATCH v4 2/9] nvme-keyring: add 'dhchap' key type
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261121/202611210348.KYpQPgoE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210348.KYpQPgoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611210348.KYpQPgoE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/common/keyring.c:348:19: warning: variable 'keylen' is uninitialized when used here [-Wuninitialized]
     348 |         prep->quotalen = keylen;
         |                          ^~~~~~
   drivers/nvme/common/keyring.c:310:40: note: initialize the variable 'keylen' to silence this warning
     310 |         size_t datalen = prep->datalen, keylen;
         |                                               ^
         |                                                = 0
   1 warning generated.


vim +/keylen +348 drivers/nvme/common/keyring.c

   293	
   294	/**
   295	 * nvme_dhchap_psk_preparse - prepare DH-HMAC-CHAP key data
   296	 * @prep: preparsed payload of the key data
   297	 *
   298	 * Decode the DH-HMAC-CHAP key data passed in @prep and
   299	 * store the resulting binary data. The binary data includes
   300	 * space for the CRC, the version, and the hmac identifier,
   301	 * but the data length is just the key data without the CRC.
   302	 * This allows the user to read the key data via the
   303	 * 'user_read()' function. The additional 'version' ahd 'hmac'
   304	 * data is used in the ->read() callback to generate the
   305	 * base64 encoded key.
   306	 */
   307	static int nvme_dhchap_psk_preparse(struct key_preparsed_payload *prep)
   308	{
   309		struct user_key_payload *upayload;
   310		size_t datalen = prep->datalen, keylen;
   311		int ret;
   312		u32 crc;
   313		u8 version, hmac;
   314	
   315		if (!prep->data) {
   316			pr_debug("%s: Empty data", __func__);
   317			prep->payload.data[0] = NULL;
   318			prep->quotalen = 0;
   319			return -EINVAL;
   320		}
   321	
   322		if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%*s",
   323			   &version, &hmac) != 2) {
   324			pr_debug("%s: invalid key data '%s'\n", __func__,
   325				 (char *)prep->data);
   326			prep->payload.data[0] = NULL;
   327			prep->quotalen = 0;
   328			return -EINVAL;
   329		}
   330	
   331		/* skip header and final ':' character */
   332		datalen -= 11;
   333	
   334		/*
   335		 * payload is < key | version | hmac >
   336		 * base64 decode will always return less data
   337		 * than the encoded data, so allocating the size
   338		 * of the encoded data will be large enough.
   339		 */
   340		upayload = kzalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
   341		if (!upayload) {
   342			prep->payload.data[0] = NULL;
   343			prep->quotalen = 0;
   344			return -ENOMEM;
   345		}
   346	
   347		/* decode the data */
 > 348		prep->quotalen = keylen;
   349		prep->payload.data[0] = upayload;
   350		ret = base64_decode(prep->data + 10, datalen, upayload->data,
   351				    true, BASE64_STD);
   352		if (ret < 0) {
   353			pr_debug("%s: Failed to decode key %s\n",
   354				 __func__, (char *)prep->data + 10);
   355			return ret;
   356		}
   357		ret -= 4;
   358		crc = ~crc32(~0, upayload->data, ret);
   359		if (get_unaligned_le32(upayload->data + ret) != crc) {
   360			pr_debug("%s: CRC mismatch for key\n", __func__);
   361			/* CRC mismatch */
   362			return -EKEYREJECTED;
   363		}
   364		/* append version and hmac to the payload */
   365		upayload->data[ret + 4] = version;
   366		upayload->data[ret + 5] = hmac;
   367		upayload->datalen = ret;
   368		return 0;
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
