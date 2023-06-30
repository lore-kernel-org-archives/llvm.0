Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F80134DD;
	Fri, 30 Jun 2023 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688129610; x=1719665610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtfM2CwPe9Irmz+ypq78MR9V52Na5zLxHKaDpjWUiHY=;
  b=cqSwFGpoarwg6qnCS6oMUYOHBi3uO+kDbksvPySvj/ZLdKdjIDS7wxkp
   mzqn3r+vbm8XQNHqvKFZlAVMpGuMij9rGbdK5ZZDrdhaSvBg6MHlTxeJ8
   FGjzrB0qIsDxu7D50UTmYEJjG1wc1eFy8PbGOLHj6CRYg4yMiscXH5oZ8
   2/fuI1Crzzq9y2fVL94dWuXRk5M76M1SdBdn6qmlr6LZeUASoyeLVnCGA
   7tNjNo95oWfXbFsCdQdGLfYBSmUuNQZY/ltQ6GBxuyQokMICvyX5neaA2
   DUoMmSfT72SSHF9Qe9ecoBVG2WSTA+ZxV1qOMvhHuXghbrSpdBLo4abDs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359863777"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="359863777"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 05:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="787714115"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="787714115"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2023 05:53:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFDcr-000EyD-2z;
	Fri, 30 Jun 2023 12:53:25 +0000
Date: Fri, 30 Jun 2023 20:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 12/20] crypto/af_alg.c:1047:9: error: use
 of undeclared identifier 'READ_FROM_ITER'
Message-ID: <202306302028.9vYZW3xA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: e023d59c1edc81db977ee1f8c9a2155097d29544 [12/20] af_alg: Set READ_FROM_ITER/WRITE_TO_ITER flag
config: hexagon-randconfig-r024-20230630 (https://download.01.org/0day-ci/archive/20230630/202306302028.9vYZW3xA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302028.9vYZW3xA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302028.9vYZW3xA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/af_alg.c:11:
   In file included from include/crypto/if_alg.h:14:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from crypto/af_alg.c:11:
   In file included from include/crypto/if_alg.h:14:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/af_alg.c:11:
   In file included from include/crypto/if_alg.h:14:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> crypto/af_alg.c:1047:9: error: use of undeclared identifier 'READ_FROM_ITER'
    1047 |                                                   READ_FROM_ITER);
         |                                                   ^
>> crypto/af_alg.c:1252:22: error: use of undeclared identifier 'WRITE_TO_ITER'
    1252 |                                          ALG_MAX_PAGES, WRITE_TO_ITER);
         |                                                         ^
   6 warnings and 2 errors generated.


vim +/READ_FROM_ITER +1047 crypto/af_alg.c

   918	
   919	/**
   920	 * af_alg_sendmsg - implementation of sendmsg system call handler
   921	 *
   922	 * The sendmsg system call handler obtains the user data and stores it
   923	 * in ctx->tsgl_list. This implies allocation of the required numbers of
   924	 * struct af_alg_tsgl.
   925	 *
   926	 * In addition, the ctx is filled with the information sent via CMSG.
   927	 *
   928	 * @sock: socket of connection to user space
   929	 * @msg: message from user space
   930	 * @size: size of message from user space
   931	 * @ivsize: the size of the IV for the cipher operation to verify that the
   932	 *	   user-space-provided IV has the right size
   933	 * Return: the number of copied data upon success, < 0 upon error
   934	 */
   935	int af_alg_sendmsg(struct socket *sock, struct msghdr *msg, size_t size,
   936			   unsigned int ivsize)
   937	{
   938		struct sock *sk = sock->sk;
   939		struct alg_sock *ask = alg_sk(sk);
   940		struct af_alg_ctx *ctx = ask->private;
   941		struct af_alg_tsgl *sgl;
   942		struct af_alg_control con = {};
   943		long copied = 0;
   944		bool enc = false;
   945		bool init = false;
   946		int err = 0;
   947	
   948		if (msg->msg_controllen) {
   949			err = af_alg_cmsg_send(msg, &con);
   950			if (err)
   951				return err;
   952	
   953			init = true;
   954			switch (con.op) {
   955			case ALG_OP_ENCRYPT:
   956				enc = true;
   957				break;
   958			case ALG_OP_DECRYPT:
   959				enc = false;
   960				break;
   961			default:
   962				return -EINVAL;
   963			}
   964	
   965			if (con.iv && con.iv->ivlen != ivsize)
   966				return -EINVAL;
   967		}
   968	
   969		lock_sock(sk);
   970		if (ctx->init && !ctx->more) {
   971			if (ctx->used) {
   972				err = -EINVAL;
   973				goto unlock;
   974			}
   975	
   976			pr_info_once(
   977				"%s sent an empty control message without MSG_MORE.\n",
   978				current->comm);
   979		}
   980		ctx->init = true;
   981	
   982		if (init) {
   983			ctx->enc = enc;
   984			if (con.iv)
   985				memcpy(ctx->iv, con.iv->iv, ivsize);
   986	
   987			ctx->aead_assoclen = con.aead_assoclen;
   988		}
   989	
   990		while (size) {
   991			struct scatterlist *sg;
   992			size_t len = size;
   993			ssize_t plen;
   994	
   995			/* use the existing memory in an allocated page */
   996			if (ctx->merge) {
   997				sgl = list_entry(ctx->tsgl_list.prev,
   998						 struct af_alg_tsgl, list);
   999				sg = sgl->sg + sgl->cur - 1;
  1000				len = min_t(size_t, len,
  1001					    PAGE_SIZE - sg->offset - sg->length);
  1002	
  1003				err = memcpy_from_msg(page_address(sg_page(sg)) +
  1004						      sg->offset + sg->length,
  1005						      msg, len);
  1006				if (err)
  1007					goto unlock;
  1008	
  1009				sg->length += len;
  1010				ctx->merge = (sg->offset + sg->length) &
  1011					     (PAGE_SIZE - 1);
  1012	
  1013				ctx->used += len;
  1014				copied += len;
  1015				size -= len;
  1016				continue;
  1017			}
  1018	
  1019			if (!af_alg_writable(sk)) {
  1020				err = af_alg_wait_for_wmem(sk, msg->msg_flags);
  1021				if (err)
  1022					goto unlock;
  1023			}
  1024	
  1025			/* allocate a new page */
  1026			len = min_t(unsigned long, len, af_alg_sndbuf(sk));
  1027	
  1028			err = af_alg_alloc_tsgl(sk);
  1029			if (err)
  1030				goto unlock;
  1031	
  1032			sgl = list_entry(ctx->tsgl_list.prev, struct af_alg_tsgl,
  1033					 list);
  1034			sg = sgl->sg;
  1035			if (sgl->cur)
  1036				sg_unmark_end(sg + sgl->cur - 1);
  1037	
  1038			if (msg->msg_flags & MSG_SPLICE_PAGES) {
  1039				struct sg_table sgtable = {
  1040					.sgl		= sg,
  1041					.nents		= sgl->cur,
  1042					.orig_nents	= sgl->cur,
  1043				};
  1044	
  1045				plen = extract_iter_to_sg(&msg->msg_iter, len, &sgtable,
  1046							  MAX_SGL_ENTS - sgl->cur,
> 1047							  READ_FROM_ITER);
  1048				if (plen < 0) {
  1049					err = plen;
  1050					goto unlock;
  1051				}
  1052	
  1053				for (; sgl->cur < sgtable.nents; sgl->cur++)
  1054					get_page(sg_page(&sg[sgl->cur]));
  1055				len -= plen;
  1056				ctx->used += plen;
  1057				copied += plen;
  1058				size -= plen;
  1059			} else {
  1060				do {
  1061					struct page *pg;
  1062					unsigned int i = sgl->cur;
  1063	
  1064					plen = min_t(size_t, len, PAGE_SIZE);
  1065	
  1066					pg = alloc_page(GFP_KERNEL);
  1067					if (!pg) {
  1068						err = -ENOMEM;
  1069						goto unlock;
  1070					}
  1071	
  1072					sg_assign_page(sg + i, pg);
  1073	
  1074					err = memcpy_from_msg(
  1075						page_address(sg_page(sg + i)),
  1076						msg, plen);
  1077					if (err) {
  1078						__free_page(sg_page(sg + i));
  1079						sg_assign_page(sg + i, NULL);
  1080						goto unlock;
  1081					}
  1082	
  1083					sg[i].length = plen;
  1084					len -= plen;
  1085					ctx->used += plen;
  1086					copied += plen;
  1087					size -= plen;
  1088					sgl->cur++;
  1089				} while (len && sgl->cur < MAX_SGL_ENTS);
  1090			}
  1091	
  1092			if (!size)
  1093				sg_mark_end(sg + sgl->cur - 1);
  1094	
  1095			ctx->merge = plen & (PAGE_SIZE - 1);
  1096		}
  1097	
  1098		err = 0;
  1099	
  1100		ctx->more = msg->msg_flags & MSG_MORE;
  1101	
  1102	unlock:
  1103		af_alg_data_wakeup(sk);
  1104		release_sock(sk);
  1105	
  1106		return copied ?: err;
  1107	}
  1108	EXPORT_SYMBOL_GPL(af_alg_sendmsg);
  1109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
