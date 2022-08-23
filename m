Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402BAA54
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661241168; x=1692777168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEOZdzegwHLzQIT58dSZ/XXOqg0uoIRUya/QlSkPQJU=;
  b=bEcTTWw6sgfa0Vwi2cEniVbItzPyInwkLsYeNCChPrTAxMKU/GafHbnP
   ssdbYodLnER/q7uCzVPpTlOgX9OwkmfQzEDDIF8So18ViQAXbuO5TGULh
   4hmBnkeiKY4Pe87dje5yj+NXQAm8keXgHoRB4gvyYS9JnnVKsH2QcMwJD
   XFCdb3iyagRB8ab25i1G3kGit24tQRhAh7XJhmaYCcF8LGu+9RQXrKPoe
   imn5DIrZUS2lziM7FDUCitTXCTwU/Vofy1p15sBOfz9EY+LtAGxBsuKXS
   CKUbtzs4YQPovKAMmH6TEUgXt/q8CgMXBrxDGXLUlY8vfoG5RLEACK7oO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294903301"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="294903301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 00:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="609256215"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2022 00:52:44 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQOiJ-00001O-34;
	Tue, 23 Aug 2022 07:52:43 +0000
Date: Tue, 23 Aug 2022 15:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Check for device max segment size
 when attaching
Message-ID: <202208231555.eczOE9TV-lkp@intel.com>
References: <20220822233025.3965-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822233025.3965-1-afd@ti.com>

Hi Andrew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.0-rc2 next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/dma-buf-cma_heap-Check-for-device-max-segment-size-when-attaching/20220823-073240
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: x86_64-randconfig-a002-20220822 (https://download.01.org/0day-ci/archive/20220823/202208231555.eczOE9TV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f390cef50ba6681ea767283e413cb8e9f8f2b426
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrew-Davis/dma-buf-cma_heap-Check-for-device-max-segment-size-when-attaching/20220823-073240
        git checkout f390cef50ba6681ea767283e413cb8e9f8f2b426
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma-buf/heaps/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/heaps/cma_heap.c:61:9: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           size_t max_segment = dma_get_max_seg_size(attachment->dev);
                  ^
   1 warning generated.


vim +61 drivers/dma-buf/heaps/cma_heap.c

    49	
    50	static int cma_heap_attach(struct dma_buf *dmabuf,
    51				   struct dma_buf_attachment *attachment)
    52	{
    53		struct cma_heap_buffer *buffer = dmabuf->priv;
    54		struct dma_heap_attachment *a;
    55		int ret;
    56	
    57		a = kzalloc(sizeof(*a), GFP_KERNEL);
    58		if (!a)
    59			return -ENOMEM;
    60	
  > 61		size_t max_segment = dma_get_max_seg_size(attachment->dev);
    62		ret = sg_alloc_table_from_pages_segment(&a->table, buffer->pages,
    63							buffer->pagecount, 0,
    64							buffer->pagecount << PAGE_SHIFT,
    65							max_segment, GFP_KERNEL);
    66		if (ret) {
    67			kfree(a);
    68			return ret;
    69		}
    70	
    71		a->dev = attachment->dev;
    72		INIT_LIST_HEAD(&a->list);
    73		a->mapped = false;
    74	
    75		attachment->priv = a;
    76	
    77		mutex_lock(&buffer->lock);
    78		list_add(&a->list, &buffer->attachments);
    79		mutex_unlock(&buffer->lock);
    80	
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
