Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37C309DBD;
	Mon, 24 Nov 2025 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991993; cv=none; b=MV4cJSaymxMPsr8H51/ST738JO+/NB2zhMGh/GLKLlK0qcJuTBkj++wK3HvfzP+LBuLORzSWUIFCmnPz97Qek3O33pX/AoP3QGUDdX+yWza3O90LMuYMQ4Bg5A4co3ng8ZADtrzXRwiEzXVCPUhFM83YIoCPhEx3I/8cnOAYpSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991993; c=relaxed/simple;
	bh=nz10a0rTJn6UPGCk99TiKY7Kkq8fanT3n4HMf2cfq0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcEMtMPwmRvUFFTISE5yTp33INvlr2i9g3Jb9nVDxlTAx7MQdbwYFqBQMp+cv48awtL79f58/AbJiWg3Zyjdzn4jOVKj+iYDXov1stM5JBe7of6r5RgW7TcX+sh/aI0TzSM3/fAuPiBV+zPON3IJ8QlW4EixyIfJS6iiMYHMmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJ4hgsPN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJ4hgsPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763991991; x=1795527991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nz10a0rTJn6UPGCk99TiKY7Kkq8fanT3n4HMf2cfq0c=;
  b=EJ4hgsPNnttk17k826JSxCw/ajMRx2+jTdOTZV/+PHdxhVx/FkO5dMEv
   /rNPlc9M/UGHcGCUsWuA9IjUeoZvDXk5OHPNWzKcaB+LWgpINDWMXwnI4
   +d25xdRdZFWPmWuWjFfLcmIsL3BE4PLOTai604IdJYfWPptMI9iED2CVM
   6j++Ne6XGBKbvd7/Ls8p03F5vSam/lpE6MzKSWtxxB/oDd+MDEK9KXn8E
   yKkYjZnKifoVk4bAaYn/D6JsOZnJwoNeaaMRwoiatpaqSWMa/6EO8IV30
   +xf8hR+YNzIR7aNDcDAjVDv5A3QKWsGbbo8LD1CuT02uviaLzszoNiD2H
   w==;
X-CSE-ConnectionGUID: 3HVUYuazStiS3mKHeED5vA==
X-CSE-MsgGUID: 5hRYXz96SpqwY5v+9MosFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65927797"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65927797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:46:30 -0800
X-CSE-ConnectionGUID: ebiqtoWcQ52Mgi8mDczUeA==
X-CSE-MsgGUID: p2EE+g4dSmCN4gt3H7iefA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197462795"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2025 05:46:29 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNWtf-000000000FN-0elq;
	Mon, 24 Nov 2025 13:46:27 +0000
Date: Mon, 24 Nov 2025 14:45:40 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-cleanup 1/12] fs/smb/client/cifsproto.h:221:57:
 error: unknown type name 'FILE_DIRECTORY_INFO'
Message-ID: <202511241403.TOtRrW21-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251124/202511241403.TOtRrW21-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241403.TOtRrW21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241403.TOtRrW21-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                         ^
   fs/smb/client/cifsproto.h:100:58: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     100 | extern int cifs_send_recv(const unsigned int xid, struct cifs_ses *ses,
         |                                                          ^
   fs/smb/client/cifsproto.h:104:62: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     104 | extern int compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
         |                                                              ^
   fs/smb/client/cifsproto.h:109:62: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     109 | extern int SendReceive(const unsigned int /* xid */ , struct cifs_ses *,
         |                                                              ^
   fs/smb/client/cifsproto.h:113:60: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     113 | extern int SendReceiveNoRsp(const unsigned int xid, struct cifs_ses *ses,
         |                                                            ^
   fs/smb/client/cifsproto.h:115:33: warning: declaration of 'struct mid_q_entry' will not be visible outside of this function [-Wvisibility]
     115 | int cifs_sync_mid_result(struct mid_q_entry *mid, struct TCP_Server_Info *server);
         |                                 ^
   fs/smb/client/cifsproto.h:116:54: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     116 | extern struct mid_q_entry *cifs_setup_request(struct cifs_ses *,
         |                                                      ^
   fs/smb/client/cifsproto.h:129:13: warning: declaration of 'struct cifs_credits' will not be visible outside of this function [-Wvisibility]
     129 |                                  struct cifs_credits *credits);
         |                                         ^
   fs/smb/client/cifsproto.h:135:15: error: incomplete definition of type 'struct TCP_Server_Info'
     135 |         return server->ops->send_cancel ?
         |                ~~~~~~^
   fs/smb/client/cifsproto.h:99:15: note: forward declaration of 'struct TCP_Server_Info'
      99 | extern struct TCP_Server_Info *cifs_pick_channel(struct cifs_ses *ses);
         |               ^
   fs/smb/client/cifsproto.h:136:11: error: incomplete definition of type 'struct TCP_Server_Info'
     136 |                                 server->ops->send_cancel(server, rqst, mid) : 0;
         |                                 ~~~~~~^
   fs/smb/client/cifsproto.h:99:15: note: forward declaration of 'struct TCP_Server_Info'
      99 | extern struct TCP_Server_Info *cifs_pick_channel(struct cifs_ses *ses);
         |               ^
   fs/smb/client/cifsproto.h:140:63: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     140 | extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
         |                                                               ^
   fs/smb/client/cifsproto.h:145:11: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     145 |                         struct cifs_tcon *ptcon,
         |                                ^
   fs/smb/client/cifsproto.h:162:43: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     162 | extern bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 eof,
         |                                           ^
   fs/smb/client/cifsproto.h:164:36: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     164 | extern void cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
         |                                    ^
   fs/smb/client/cifsproto.h:166:46: warning: declaration of 'struct cifs_io_subrequest' will not be visible outside of this function [-Wvisibility]
     166 | void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result);
         |                                              ^
   fs/smb/client/cifsproto.h:167:55: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     167 | extern struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *, int);
         |                                                       ^
   fs/smb/client/cifsproto.h:168:42: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     168 | extern int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode,
         |                                          ^
   fs/smb/client/cifsproto.h:171:42: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     171 | extern int cifs_get_writable_path(struct cifs_tcon *tcon, const char *name,
         |                                          ^
   fs/smb/client/cifsproto.h:174:55: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     174 | extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, bool);
         |                                                       ^
   fs/smb/client/cifsproto.h:175:42: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     175 | extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
         |                                          ^
   fs/smb/client/cifsproto.h:177:42: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     177 | extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
         |                                          ^
   fs/smb/client/cifsproto.h:187:21: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     187 |                             const struct cifs_tcon *, int /* length of
         |                                          ^
   fs/smb/client/cifsproto.h:190:12: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     190 |                                 struct cifs_ses *ses,
         |                                        ^
   fs/smb/client/cifsproto.h:194:58: warning: declaration of 'struct cifs_ses' will not be visible outside of this function [-Wvisibility]
     194 | extern int CIFS_SessSetup(const unsigned int xid, struct cifs_ses *ses,
         |                                                          ^
   fs/smb/client/cifsproto.h:201:42: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     201 | extern void cifs_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock);
         |                                          ^
   fs/smb/client/cifsproto.h:202:35: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     202 | extern int cifs_get_writer(struct cifsInodeInfo *cinode);
         |                                   ^
   fs/smb/client/cifsproto.h:203:36: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     203 | extern void cifs_put_writer(struct cifsInodeInfo *cinode);
         |                                    ^
   fs/smb/client/cifsproto.h:204:43: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     204 | extern void cifs_done_oplock_break(struct cifsInodeInfo *cinode);
         |                                           ^
   fs/smb/client/cifsproto.h:210:47: warning: declaration of 'struct cifs_fid' will not be visible outside of this function [-Wvisibility]
     210 | struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
         |                                               ^
   fs/smb/client/cifsproto.h:217:56: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     217 | void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
         |                                                        ^
   fs/smb/client/cifsproto.h:218:45: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     218 | extern void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr,
         |                                             ^
   fs/smb/client/cifsproto.h:221:43: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     221 | extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
         |                                           ^
>> fs/smb/client/cifsproto.h:221:57: error: unknown type name 'FILE_DIRECTORY_INFO'
     221 | extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
         |                                                         ^
   fs/smb/client/cifsproto.h:223:60: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     223 | extern int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
         |                                                            ^
   fs/smb/client/cifsproto.h:226:18: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     226 |                                struct cifs_fattr *fattr);
         |                                       ^
   fs/smb/client/cifsproto.h:229:11: warning: declaration of 'struct cifs_open_info_data' will not be visible outside of this function [-Wvisibility]
     229 |                         struct cifs_open_info_data *data, struct super_block *sb, int xid,
         |                                ^
   fs/smb/client/cifsproto.h:230:17: warning: declaration of 'struct cifs_fid' will not be visible outside of this function [-Wvisibility]
     230 |                         const struct cifs_fid *fid);
         |                                      ^
   fs/smb/client/cifsproto.h:233:19: warning: declaration of 'struct cifs_open_info_data' will not be visible outside of this function [-Wvisibility]
     233 |                                        struct cifs_open_info_data *data,
         |                                               ^
   fs/smb/client/cifsproto.h:244:59: warning: declaration of 'struct smb_sid' will not be visible outside of this function [-Wvisibility]
     244 | extern int sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
         |                                                           ^
   fs/smb/client/cifsproto.h:245:12: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     245 |                                 struct cifs_fattr *fattr, uint sidtype);
         |                                        ^
   fs/smb/client/cifsproto.h:247:17: warning: declaration of 'struct cifs_fattr' will not be visible outside of this function [-Wvisibility]
     247 |                               struct cifs_fattr *fattr, struct inode *inode,
         |                                      ^
   fs/smb/client/cifsproto.h:249:41: warning: declaration of 'struct cifs_fid' will not be visible outside of this function [-Wvisibility]
     249 |                               const char *path, const struct cifs_fid *pfid);
         |                                                              ^
   fs/smb/client/cifsproto.h:255:18: warning: declaration of 'struct cifs_fid' will not be visible outside of this function [-Wvisibility]
     255 |                                 const struct cifs_fid *pfid, u32 *plen, u32 info);
         |                                              ^
   fs/smb/client/cifsproto.h:262:48: warning: declaration of 'struct smb_ace' will not be visible outside of this function [-Wvisibility]
     262 | extern unsigned int setup_authusers_ACE(struct smb_ace *pace);
         |                                                ^
   fs/smb/client/cifsproto.h:263:51: warning: declaration of 'struct smb_ace' will not be visible outside of this function [-Wvisibility]
     263 | extern unsigned int setup_special_mode_ACE(struct smb_ace *pace,
         |                                                   ^
   fs/smb/client/cifsproto.h:266:57: warning: declaration of 'struct smb_ace' will not be visible outside of this function [-Wvisibility]
     266 | extern unsigned int setup_special_user_owner_ACE(struct smb_ace *pace);
         |                                                         ^
   fs/smb/client/cifsproto.h:277:34: warning: declaration of 'struct cifs_mount_ctx' will not be visible outside of this function [-Wvisibility]
     277 | void cifs_mount_put_conns(struct cifs_mount_ctx *mnt_ctx);
         |                                  ^
   fs/smb/client/cifsproto.h:278:35: warning: declaration of 'struct cifs_mount_ctx' will not be visible outside of this function [-Wvisibility]
     278 | int cifs_mount_get_session(struct cifs_mount_ctx *mnt_ctx);
         |                                   ^
   fs/smb/client/cifsproto.h:279:32: warning: declaration of 'struct cifs_mount_ctx' will not be visible outside of this function [-Wvisibility]
     279 | int cifs_is_path_remote(struct cifs_mount_ctx *mnt_ctx);
         |                                ^
   fs/smb/client/cifsproto.h:280:32: warning: declaration of 'struct cifs_mount_ctx' will not be visible outside of this function [-Wvisibility]
     280 | int cifs_mount_get_tcon(struct cifs_mount_ctx *mnt_ctx);
         |                                ^
   fs/smb/client/cifsproto.h:284:49: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     284 | extern void cifs_mark_open_files_invalid(struct cifs_tcon *tcon);
         |                                                 ^
   fs/smb/client/cifsproto.h:285:51: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     285 | extern void cifs_reopen_persistent_handles(struct cifs_tcon *tcon);
         |                                                   ^
   fs/smb/client/cifsproto.h:289:16: warning: declaration of 'struct cifsLockInfo' will not be visible outside of this function [-Wvisibility]
     289 |                                     struct cifsLockInfo **conf_lock,
         |                                            ^
   fs/smb/client/cifsproto.h:291:42: warning: declaration of 'struct cifs_fid' will not be visible outside of this function [-Wvisibility]
     291 | extern void cifs_add_pending_open(struct cifs_fid *fid,
         |                                          ^
   fs/smb/client/cifsproto.h:293:14: warning: declaration of 'struct cifs_pending_open' will not be visible outside of this function [-Wvisibility]
     293 |                                   struct cifs_pending_open *open);
         |                                          ^
   fs/smb/client/cifsproto.h:294:49: warning: declaration of 'struct cifs_fid' will not be visible outside of this function [-Wvisibility]
     294 | extern void cifs_add_pending_open_locked(struct cifs_fid *fid,
         |                                                 ^
   fs/smb/client/cifsproto.h:296:14: warning: declaration of 'struct cifs_pending_open' will not be visible outside of this function [-Wvisibility]
     296 |                                          struct cifs_pending_open *open);
         |                                                 ^
   fs/smb/client/cifsproto.h:297:42: warning: declaration of 'struct cifs_pending_open' will not be visible outside of this function [-Wvisibility]
     297 | extern void cifs_del_pending_open(struct cifs_pending_open *open);
         |                                          ^
   fs/smb/client/cifsproto.h:300:12: warning: declaration of 'struct cifs_deferred_close' will not be visible outside of this function [-Wvisibility]
     300 |                                 struct cifs_deferred_close **dclose);
         |                                        ^
   fs/smb/client/cifsproto.h:303:12: warning: declaration of 'struct cifs_deferred_close' will not be visible outside of this function [-Wvisibility]
     303 |                                 struct cifs_deferred_close *dclose);
         |                                        ^
   fs/smb/client/cifsproto.h:307:45: warning: declaration of 'struct cifsInodeInfo' will not be visible outside of this function [-Wvisibility]
     307 | extern void cifs_close_deferred_file(struct cifsInodeInfo *cifs_inode);
         |                                             ^
   fs/smb/client/cifsproto.h:309:50: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     309 | extern void cifs_close_all_deferred_files(struct cifs_tcon *cifs_tcon);
         |                                                  ^
   fs/smb/client/cifsproto.h:311:51: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     311 | void cifs_close_deferred_file_under_dentry(struct cifs_tcon *cifs_tcon,
         |                                                   ^
   fs/smb/client/cifsproto.h:322:34: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     322 | extern void cifs_put_tcon(struct cifs_tcon *tcon, enum smb3_tcon_ref_trace trace);
         |                                  ^
   fs/smb/client/cifsproto.h:331:42: warning: declaration of 'struct cifsLockInfo' will not be visible outside of this function [-Wvisibility]
     331 | extern void cifs_del_lock_waiters(struct cifsLockInfo *lock);
         |                                          ^
   fs/smb/client/cifsproto.h:333:54: warning: declaration of 'struct cifs_tcon' will not be visible outside of this function [-Wvisibility]
     333 | int cifs_tree_connect(const unsigned int xid, struct cifs_tcon *tcon);


vim +/FILE_DIRECTORY_INFO +221 fs/smb/client/cifsproto.h

1bd5bbcb653177 fs/cifs/cifsproto.h       Steve French       2006-09-28  208  
d46b0da7a33dd8 fs/cifs/cifsproto.h       Dave Wysochanski   2019-10-23  209  extern void cifs_down_write(struct rw_semaphore *sem);
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara    2022-10-03  210  struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara    2022-10-03  211  				       struct tcon_link *tlink, __u32 oplock,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara    2022-10-03  212  				       const char *symlink_target);
f6f1f1790775fb fs/cifs/cifsproto.h       Al Viro            2021-03-18  213  extern int cifs_posix_open(const char *full_path, struct inode **inode,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky    2012-06-20  214  			   struct super_block *sb, int mode,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky    2012-06-20  215  			   unsigned int f_flags, __u32 *oplock, __u16 *netfid,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky    2012-06-20  216  			   unsigned int xid);
4065c802da7484 fs/cifs/cifsproto.h       Jeff Layton        2010-05-17  217  void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  218  extern void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  219  				     FILE_UNIX_BASIC_INFO *info,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  220  				     struct cifs_sb_info *cifs_sb);
c052e2b423f3ea fs/cifs/cifsproto.h       Shirish Pargaonkar 2012-09-28 @221  extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
c052e2b423f3ea fs/cifs/cifsproto.h       Shirish Pargaonkar 2012-09-28  222  					struct cifs_sb_info *);
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM         2024-02-29  223  extern int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM         2024-02-29  224  			       bool from_readdir);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  225  extern struct inode *cifs_iget(struct super_block *sb,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  226  			       struct cifs_fattr *fattr);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  227  

:::::: The code at line 221 was first introduced by commit
:::::: c052e2b423f3eabe9f3f32e60744afa5cf26f6b9 cifs: obtain file access during backup intent lookup (resend)

:::::: TO: Shirish Pargaonkar <shirishpargaonkar@gmail.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
