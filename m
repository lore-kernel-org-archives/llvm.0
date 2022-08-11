Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A912CA7
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660204021; x=1691740021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKp4N2u4hPVRhTJz2Clk1m4l+6YwU6doakkwzGr4b0c=;
  b=eLAtVs47isFvHiQZSnoRpEOOuVVd6aozWB1Wu1j7QTui6h9zDmwp815a
   F+KNAh7A6g6x4oyKs+DxI+60DqGLUvbjf4dMF7rxiUBtioa2hXczZ0nal
   OdW2cWKA1xCO6Ikj9fHzLLqXxatztFN/tEmbaaoJIOd6Fxx0wiOogRf0m
   xEOk5iZf8I/qdwjUqNZLRdkfiDSbxrf7klOKrT30nIi/cDzw7NlLCJfZ6
   faiK/3E7uQa0AbNrcuQp4arLWH8LrvMEEcVqxajMUHychzl07Me9sQmfA
   npVBYRHJCf8ealnPWVrE7XYXsNsYvX94D0If4Mlz52grjXlfmJ1PT0OeM
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="353024197"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="353024197"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 00:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="556037015"
Received: from lkp-server02.sh.intel.com (HELO d10ab0927833) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2022 00:46:58 -0700
Received: from kbuild by d10ab0927833 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oM2uA-00006h-16;
	Thu, 11 Aug 2022 07:46:58 +0000
Date: Thu, 11 Aug 2022 15:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [linux-next:master 14849/15097]
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
Message-ID: <202208111501.5PSP1WaM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   40d43a7507e1547dd45cb02af2e40d897c591870
commit: d79b32c2e4a4e66d5678410cd45815c1c2375196 [14849/15097] vdpa_sim_blk: add support for discard and write-zeroes
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220811/202208111501.5PSP1WaM-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d79b32c2e4a4e66d5678410cd45815c1c2375196
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d79b32c2e4a4e66d5678410cd45815c1c2375196
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vdpa/vdpa_sim/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
                   struct virtio_blk_discard_write_zeroes range;
                   ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:204:25: error: use of undeclared identifier 'range'
                   if (to_pull != sizeof(range)) {
                                         ^
   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:207:21: error: use of undeclared identifier 'range'
                                   to_pull, sizeof(range));
                                                   ^
   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:212:60: error: use of undeclared identifier 'range'
                   bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
                                                                            ^
   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:222:38: error: use of undeclared identifier 'range'
                   sector = vdpasim64_to_cpu(vdpasim, range.sector);
                                                      ^
   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:43: error: use of undeclared identifier 'range'
                   num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
                                                           ^
   drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:37: error: use of undeclared identifier 'range'
                   flags = vdpasim32_to_cpu(vdpasim, range.flags);
                                                     ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:7: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                   u32 num_sectors, flags;
                       ^
   1 warning and 7 errors generated.


vim +201 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c

    74	
    75	/* Returns 'true' if the request is handled (with or without an I/O error)
    76	 * and the status is correctly written in the last byte of the 'in iov',
    77	 * 'false' otherwise.
    78	 */
    79	static bool vdpasim_blk_handle_req(struct vdpasim *vdpasim,
    80					   struct vdpasim_virtqueue *vq)
    81	{
    82		size_t pushed = 0, to_pull, to_push;
    83		struct virtio_blk_outhdr hdr;
    84		bool handled = false;
    85		ssize_t bytes;
    86		loff_t offset;
    87		u64 sector;
    88		u8 status;
    89		u32 type;
    90		int ret;
    91	
    92		ret = vringh_getdesc_iotlb(&vq->vring, &vq->out_iov, &vq->in_iov,
    93					   &vq->head, GFP_ATOMIC);
    94		if (ret != 1)
    95			return false;
    96	
    97		if (vq->out_iov.used < 1 || vq->in_iov.used < 1) {
    98			dev_dbg(&vdpasim->vdpa.dev, "missing headers - out_iov: %u in_iov %u\n",
    99				vq->out_iov.used, vq->in_iov.used);
   100			goto err;
   101		}
   102	
   103		if (vq->in_iov.iov[vq->in_iov.used - 1].iov_len < 1) {
   104			dev_dbg(&vdpasim->vdpa.dev, "request in header too short\n");
   105			goto err;
   106		}
   107	
   108		/* The last byte is the status and we checked if the last iov has
   109		 * enough room for it.
   110		 */
   111		to_push = vringh_kiov_length(&vq->in_iov) - 1;
   112	
   113		to_pull = vringh_kiov_length(&vq->out_iov);
   114	
   115		bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &hdr,
   116					      sizeof(hdr));
   117		if (bytes != sizeof(hdr)) {
   118			dev_dbg(&vdpasim->vdpa.dev, "request out header too short\n");
   119			goto err;
   120		}
   121	
   122		to_pull -= bytes;
   123	
   124		type = vdpasim32_to_cpu(vdpasim, hdr.type);
   125		sector = vdpasim64_to_cpu(vdpasim, hdr.sector);
   126		offset = sector << SECTOR_SHIFT;
   127		status = VIRTIO_BLK_S_OK;
   128	
   129		if (type != VIRTIO_BLK_T_IN && type != VIRTIO_BLK_T_OUT &&
   130		    sector != 0) {
   131			dev_dbg(&vdpasim->vdpa.dev,
   132				"sector must be 0 for %u request - sector: 0x%llx\n",
   133				type, sector);
   134			status = VIRTIO_BLK_S_IOERR;
   135			goto err_status;
   136		}
   137	
   138		switch (type) {
   139		case VIRTIO_BLK_T_IN:
   140			if (!vdpasim_blk_check_range(vdpasim, sector,
   141						     to_push >> SECTOR_SHIFT,
   142						     VDPASIM_BLK_SIZE_MAX * VDPASIM_BLK_SEG_MAX)) {
   143				status = VIRTIO_BLK_S_IOERR;
   144				break;
   145			}
   146	
   147			bytes = vringh_iov_push_iotlb(&vq->vring, &vq->in_iov,
   148						      vdpasim->buffer + offset,
   149						      to_push);
   150			if (bytes < 0) {
   151				dev_dbg(&vdpasim->vdpa.dev,
   152					"vringh_iov_push_iotlb() error: %zd offset: 0x%llx len: 0x%zx\n",
   153					bytes, offset, to_push);
   154				status = VIRTIO_BLK_S_IOERR;
   155				break;
   156			}
   157	
   158			pushed += bytes;
   159			break;
   160	
   161		case VIRTIO_BLK_T_OUT:
   162			if (!vdpasim_blk_check_range(vdpasim, sector,
   163						     to_pull >> SECTOR_SHIFT,
   164						     VDPASIM_BLK_SIZE_MAX * VDPASIM_BLK_SEG_MAX)) {
   165				status = VIRTIO_BLK_S_IOERR;
   166				break;
   167			}
   168	
   169			bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov,
   170						      vdpasim->buffer + offset,
   171						      to_pull);
   172			if (bytes < 0) {
   173				dev_dbg(&vdpasim->vdpa.dev,
   174					"vringh_iov_pull_iotlb() error: %zd offset: 0x%llx len: 0x%zx\n",
   175					bytes, offset, to_pull);
   176				status = VIRTIO_BLK_S_IOERR;
   177				break;
   178			}
   179			break;
   180	
   181		case VIRTIO_BLK_T_GET_ID:
   182			bytes = vringh_iov_push_iotlb(&vq->vring, &vq->in_iov,
   183						      vdpasim_blk_id,
   184						      VIRTIO_BLK_ID_BYTES);
   185			if (bytes < 0) {
   186				dev_dbg(&vdpasim->vdpa.dev,
   187					"vringh_iov_push_iotlb() error: %zd\n", bytes);
   188				status = VIRTIO_BLK_S_IOERR;
   189				break;
   190			}
   191	
   192			pushed += bytes;
   193			break;
   194	
   195		case VIRTIO_BLK_T_FLUSH:
   196			/* nothing to do */
   197			break;
   198	
   199		case VIRTIO_BLK_T_DISCARD:
   200		case VIRTIO_BLK_T_WRITE_ZEROES:
 > 201			struct virtio_blk_discard_write_zeroes range;
 > 202			u32 num_sectors, flags;
   203	
 > 204			if (to_pull != sizeof(range)) {
   205				dev_dbg(&vdpasim->vdpa.dev,
   206					"discard/write_zeroes header len: 0x%zx [expected: 0x%zx]\n",
   207					to_pull, sizeof(range));
   208				status = VIRTIO_BLK_S_IOERR;
   209				break;
   210			}
   211	
   212			bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
   213						      to_pull);
   214			if (bytes < 0) {
   215				dev_dbg(&vdpasim->vdpa.dev,
   216					"vringh_iov_pull_iotlb() error: %zd offset: 0x%llx len: 0x%zx\n",
   217					bytes, offset, to_pull);
   218				status = VIRTIO_BLK_S_IOERR;
   219				break;
   220			}
   221	
   222			sector = vdpasim64_to_cpu(vdpasim, range.sector);
   223			offset = sector << SECTOR_SHIFT;
   224			num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
   225			flags = vdpasim32_to_cpu(vdpasim, range.flags);
   226	
   227			if (type == VIRTIO_BLK_T_DISCARD && flags != 0) {
   228				dev_dbg(&vdpasim->vdpa.dev,
   229					"discard unexpected flags set - flags: 0x%x\n",
   230					flags);
   231				status = VIRTIO_BLK_S_UNSUPP;
   232				break;
   233			}
   234	
   235			if (type == VIRTIO_BLK_T_WRITE_ZEROES &&
   236			    flags & ~VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP) {
   237				dev_dbg(&vdpasim->vdpa.dev,
   238					"write_zeroes unexpected flags set - flags: 0x%x\n",
   239					flags);
   240				status = VIRTIO_BLK_S_UNSUPP;
   241				break;
   242			}
   243	
   244			if (!vdpasim_blk_check_range(vdpasim, sector, num_sectors,
   245						     VDPASIM_BLK_DWZ_MAX_SECTORS)) {
   246				status = VIRTIO_BLK_S_IOERR;
   247				break;
   248			}
   249	
   250			if (type == VIRTIO_BLK_T_WRITE_ZEROES) {
   251				memset(vdpasim->buffer + offset, 0,
   252				       num_sectors << SECTOR_SHIFT);
   253			}
   254	
   255			break;
   256	
   257		default:
   258			dev_dbg(&vdpasim->vdpa.dev,
   259				"Unsupported request type %d\n", type);
   260			status = VIRTIO_BLK_S_IOERR;
   261			break;
   262		}
   263	
   264	err_status:
   265		/* If some operations fail, we need to skip the remaining bytes
   266		 * to put the status in the last byte
   267		 */
   268		if (to_push - pushed > 0)
   269			vringh_kiov_advance(&vq->in_iov, to_push - pushed);
   270	
   271		/* Last byte is the status */
   272		bytes = vringh_iov_push_iotlb(&vq->vring, &vq->in_iov, &status, 1);
   273		if (bytes != 1)
   274			goto err;
   275	
   276		pushed += bytes;
   277	
   278		/* Make sure data is wrote before advancing index */
   279		smp_wmb();
   280	
   281		handled = true;
   282	
   283	err:
   284		vringh_complete_iotlb(&vq->vring, vq->head, pushed);
   285	
   286		return handled;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
