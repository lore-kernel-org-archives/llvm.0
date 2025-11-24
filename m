Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559EC2741C0;
	Mon, 24 Nov 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981431; cv=none; b=jZQ+gyMAoU2ymRQfM1f+Abx+PxQMnL/Qhh7ZBiLV3S38/6cVfk05z5zfbD1q+n6eQG0iNHj77X4DyJioKjht/w7L9V5yN9ccoQLo7EKzLrMLUn3cp11OleOHEdrnO6InYEpM80qjupLANq4c80zNvHImtSkMOC/a1K0da7oR8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981431; c=relaxed/simple;
	bh=k2kon0HHl46S2g2LDEgPZVBDfYmMPvineHJxVxMXMV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlBhUB6KFDMHHbGKWSpVgwXbByjVqWDBI5fwHZeUR7X7hGsVF+uqDNngqXCEEbyiXBlPpXhhSP/4QTXmw6ELABJQOmJw3YB1hqRsZyMEGNk4z1ljcjD0YEWDz/EkGefFyEpWGKkm18qR9KD4PyCPReSkE3JjN57M/53q/vsLinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yk3p4VgU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yk3p4VgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763981429; x=1795517429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2kon0HHl46S2g2LDEgPZVBDfYmMPvineHJxVxMXMV0=;
  b=Yk3p4VgUsqYpjumaIFf0wZB4sF+Sf2+myKjJtZ0mp+UVbTz9AnkzFgCw
   v8kn+6virvNVTs6tTbcfvxOmhuWxq+Hzh2k+vdYzeGek4aXCCopH1TPYY
   /Fkxapfiq+QPNLEYkIvkh5LHAqLbUHIQsBgwAbX6cAcjPM2oy/dqnSkl6
   TCyrMJCNeGJd5EmSAOZAAomAvsv/+eDXuBbDSV4hsBrWKw0gSQRWr2IiV
   fl3hGq046kyPCD7hjLcqThbhfhJg9oNi2nlQ+9mpvCTS8Hp9JdP21PU8p
   eRUlNmI1HaDQiLZk4v3Feqxkds8AD/lx4/Wej2tySQWvUJLoKhKLeQ5iZ
   w==;
X-CSE-ConnectionGUID: /gZuubZ+SnSg02vLHBtCKQ==
X-CSE-MsgGUID: hzNnt0qWTwWzgrSPk3OQ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83365852"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="83365852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:50:28 -0800
X-CSE-ConnectionGUID: 3rB9IariSvWaPyFVDRGeUA==
X-CSE-MsgGUID: VDY2GrSARlOybo7hTDdvEg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 02:50:28 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNU9J-000000000DJ-1rsS;
	Mon, 24 Nov 2025 10:50:25 +0000
Date: Mon, 24 Nov 2025 11:49:25 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-cleanup 1/12] fs/smb/client/cifsproto.h:634:30:
 warning: declaration of 'struct cifs_calc_sig_ctx' will not be visible
 outside of this function
Message-ID: <202511241148.w7P5A0rT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-cleanup
head:   04f6c96ee8167c25e3e8403da23a09e8b926e88b
commit: aa358cceaf202eadae85a42a3e34e941628a68fa [1/12] cifs: Do some preparation prior to organising the function declarations
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251124/202511241148.w7P5A0rT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241148.w7P5A0rT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241148.w7P5A0rT-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                          ^
   fs/smb/client/cifsproto.h:448:14: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     448 |                                   struct cifs_tcon *tcon, const char *file_name,
         |                                          ^
   fs/smb/client/cifsproto.h:454:25: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     454 |                         umode_t mode, struct cifs_tcon *tcon,
         |                                              ^
   fs/smb/client/cifsproto.h:456:56: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     456 | extern int CIFSSMBRmDir(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^
   fs/smb/client/cifsproto.h:458:60: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     458 | extern int CIFSPOSIXDelFile(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                            ^
   fs/smb/client/cifsproto.h:462:58: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     462 | extern int CIFSSMBDelFile(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                          ^
   fs/smb/client/cifsproto.h:465:50: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     465 | int CIFSSMBRename(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                  ^
   fs/smb/client/cifsproto.h:469:65: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     469 | extern int CIFSSMBRenameOpenFile(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                                 ^
   fs/smb/client/cifsproto.h:474:17: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     474 |                        struct cifs_tcon *tcon,
         |                               ^
   fs/smb/client/cifsproto.h:479:11: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     479 |                         struct cifs_tcon *tcon,
         |                                ^
   fs/smb/client/cifsproto.h:484:11: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     484 |                         struct cifs_tcon *tcon,
         |                                ^
   fs/smb/client/cifsproto.h:488:11: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     488 |                         struct cifs_tcon *tcon,
         |                                ^
   fs/smb/client/cifsproto.h:492:16: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     492 |                                     struct cifs_tcon *tcon,
         |                                            ^
   fs/smb/client/cifsproto.h:497:55: warning: declaration of 'struct cifs_open_info_data' will not be visible outside of this function [-Wvisibility]
     497 | extern struct inode *cifs_create_reparse_inode(struct cifs_open_info_data *data,
         |                                                       ^
   fs/smb/client/cifsproto.h:500:20: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     500 |                                                struct cifs_tcon *tcon,
         |                                                       ^
   fs/smb/client/cifsproto.h:506:15: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     506 |                                    struct cifs_tcon *tcon, __u16 fid);
         |                                           ^
   fs/smb/client/cifsproto.h:507:53: warning: declaration of 'struct cifs_open_parms' will not be visible outside of this function [-Wvisibility]
     507 | extern int CIFS_open(const unsigned int xid, struct cifs_open_parms *oparms,
         |                                                     ^
   fs/smb/client/cifsproto.h:509:57: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     509 | extern int SMBLegacyOpen(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                         ^
   fs/smb/client/cifsproto.h:514:59: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     514 | extern int CIFSPOSIXCreate(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                           ^
   fs/smb/client/cifsproto.h:519:56: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     519 | extern int CIFSSMBClose(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^
   fs/smb/client/cifsproto.h:522:56: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     522 | extern int CIFSSMBFlush(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^
   fs/smb/client/cifsproto.h:525:55: warning: declaration of 'struct cifs_io_parms' will not be visible outside of this function [-Wvisibility]
     525 | extern int CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
         |                                                       ^
   fs/smb/client/cifsproto.h:528:56: warning: declaration of 'struct cifs_io_parms' will not be visible outside of this function [-Wvisibility]
     528 | extern int CIFSSMBWrite(const unsigned int xid, struct cifs_io_parms *io_parms,
         |                                                        ^
   fs/smb/client/cifsproto.h:530:57: warning: declaration of 'struct cifs_io_parms' will not be visible outside of this function [-Wvisibility]
     530 | extern int CIFSSMBWrite2(const unsigned int xid, struct cifs_io_parms *io_parms,
         |                                                         ^
   fs/smb/client/cifsproto.h:532:65: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     532 | extern int CIFSGetSrvInodeNumber(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                                 ^
   fs/smb/client/cifsproto.h:537:54: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     537 | extern int cifs_lockv(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                      ^
   fs/smb/client/cifsproto.h:541:55: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     541 | extern int CIFSSMBLock(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                       ^
   fs/smb/client/cifsproto.h:546:60: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     546 | extern int CIFSSMBPosixLock(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                            ^
   fs/smb/client/cifsproto.h:551:55: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     551 | extern int CIFSSMBTDis(const unsigned int xid, struct cifs_tcon *tcon);
         |                                                       ^
   fs/smb/client/cifsproto.h:553:57: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     553 | extern int CIFSSMBLogoff(const unsigned int xid, struct cifs_ses *ses);
         |                                                         ^
   fs/smb/client/cifsproto.h:603:45: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     603 | extern bool couldbe_mf_symlink(const struct cifs_fattr *fattr);
         |                                             ^
   fs/smb/client/cifsproto.h:606:17: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     606 |                               struct cifs_fattr *fattr,
         |                                      ^
   fs/smb/client/cifsproto.h:621:29: warning: declaration of 'struct cifs_io_subrequest' will not be visible outside of this function [-Wvisibility]
     621 | int cifs_async_readv(struct cifs_io_subrequest *rdata);
         |                             ^
   fs/smb/client/cifsproto.h:624:31: warning: declaration of 'struct cifs_io_subrequest' will not be visible outside of this function [-Wvisibility]
     624 | void cifs_async_writev(struct cifs_io_subrequest *wdata);
         |                               ^
>> fs/smb/client/cifsproto.h:634:30: warning: declaration of 'struct cifs_calc_sig_ctx' will not be visible outside of this function [-Wvisibility]
     634 |                           char *signature, struct cifs_calc_sig_ctx *ctx);
         |                                                   ^
   fs/smb/client/cifsproto.h:638:46: warning: declaration of 'struct shash_desc' will not be visible outside of this function [-Wvisibility]
     638 | int cifs_alloc_hash(const char *name, struct shash_desc **sdesc);
         |                                              ^
   fs/smb/client/cifsproto.h:639:28: warning: declaration of 'struct shash_desc' will not be visible outside of this function [-Wvisibility]
     639 | void cifs_free_hash(struct shash_desc **sdesc);
         |                            ^
   fs/smb/client/cifsproto.h:642:54: warning: declaration of 'struct cifs_server_iface' will not be visible outside of this function [-Wvisibility]
     642 | bool is_ses_using_iface(struct cifs_ses *ses, struct cifs_server_iface *iface);
         |                                                      ^
   fs/smb/client/cifsproto.h:677:18: warning: declaration of 'struct cifs_search_info' will not be visible outside of this function [-Wvisibility]
     677 |                                struct cifs_search_info *srch_inf);
         |                                       ^
   fs/smb/client/cifsproto.h:687:11: warning: declaration of 'struct cifs_open_info_data' will not be visible outside of this function [-Wvisibility]
     687 |                         struct cifs_open_info_data *data);
         |                                ^
   fs/smb/client/cifsproto.h:752:23: error: use of undeclared identifier 'cifs_tcp_ses_lock'
     752 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^
   fs/smb/client/cifsproto.h:753:5: error: incomplete definition of type 'struct cifs_ses'
     753 |         ses->ses_count++;
         |         ~~~^
   fs/smb/client/cifsproto.h:555:15: note: forward declaration of 'struct cifs_ses'
     555 | extern struct cifs_ses *sesInfoAlloc(void);
         |               ^
   fs/smb/client/cifsproto.h:772:15: error: incomplete definition of type 'struct mid_q_entry'
     772 |         kref_put(&mid->refcount, __release_mid);
         |                   ~~~^
   fs/smb/client/cifsproto.h:116:15: note: forward declaration of 'struct mid_q_entry'
     116 | extern struct mid_q_entry *cifs_setup_request(struct cifs_ses *,
         |               ^
   fs/smb/client/cifsproto.h:775:47: warning: declaration of 'struct cifs_open_info_data' will not be visible outside of this function [-Wvisibility]
     775 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^
   fs/smb/client/cifsproto.h:777:12: error: incomplete definition of type 'struct cifs_open_info_data'
     777 |         kfree(data->symlink_target);
         |               ~~~~^
   fs/smb/client/cifsproto.h:775:47: note: forward declaration of 'struct cifs_open_info_data'
     775 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^
   fs/smb/client/cifsproto.h:778:19: error: incomplete definition of type 'struct cifs_open_info_data'
     778 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                      ~~~~^
   fs/smb/client/cifsproto.h:775:47: note: forward declaration of 'struct cifs_open_info_data'
     775 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^
   fs/smb/client/cifsproto.h:778:45: error: incomplete definition of type 'struct cifs_open_info_data'
     778 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                                                ~~~~^
   fs/smb/client/cifsproto.h:775:47: note: forward declaration of 'struct cifs_open_info_data'
     775 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^
   fs/smb/client/cifsproto.h:779:24: error: invalid application of 'sizeof' to an incomplete type 'struct cifs_open_info_data'
     779 |         memset(data, 0, sizeof(*data));
         |                               ^~~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                                                    ^
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   fs/smb/client/cifsproto.h:775:47: note: forward declaration of 'struct cifs_open_info_data'
     775 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^
   146 warnings and 13 errors generated.


vim +634 fs/smb/client/cifsproto.h

e28bc5b1fdbd6e fs/cifs/cifsproto.h       Jeff Layton    2011-10-19  623  
3ee1a1fc398199 fs/smb/client/cifsproto.h David Howells  2023-10-06  624  void cifs_async_writev(struct cifs_io_subrequest *wdata);
b5be1a1c4c57a0 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  625  int cifs_query_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
b5be1a1c4c57a0 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  626  			  struct cifs_sb_info *cifs_sb,
b5be1a1c4c57a0 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  627  			  const unsigned char *path, char *pbuf,
b5be1a1c4c57a0 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  628  			  unsigned int *pbytes_read);
cbb0aba6ff3ff5 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  629  int cifs_create_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
cbb0aba6ff3ff5 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  630  			   struct cifs_sb_info *cifs_sb,
cbb0aba6ff3ff5 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  631  			   const unsigned char *path, char *pbuf,
cbb0aba6ff3ff5 fs/cifs/cifsproto.h       Sachin Prabhu  2013-11-25  632  			   unsigned int *pbytes_written);
e05b3115e75381 fs/smb/client/cifsproto.h Eric Biggers   2025-10-11  633  int __cifs_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
e05b3115e75381 fs/smb/client/cifsproto.h Eric Biggers   2025-10-11 @634  			  char *signature, struct cifs_calc_sig_ctx *ctx);
ef65aaede23f75 fs/cifs/cifsproto.h       Sachin Prabhu  2017-01-18  635  enum securityEnum cifs_select_sectype(struct TCP_Server_Info *,
ef65aaede23f75 fs/cifs/cifsproto.h       Sachin Prabhu  2017-01-18  636  					enum securityEnum);
82fb82be055854 fs/cifs/cifsproto.h       Aurelien Aptel 2018-02-16  637  

:::::: The code at line 634 was first introduced by commit
:::::: e05b3115e75381369be84abe5d46565ce0fcedc8 smb: client: Use HMAC-SHA256 library for SMB2 signature calculation

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
