Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC758829;
	Thu, 26 Oct 2023 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="M8rt++6e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EdV2l51B"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4FCA35C0244;
	Thu, 26 Oct 2023 10:37:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 26 Oct 2023 10:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698331059; x=1698417459; bh=AP
	8v+9R0WrLVWBhLRKm9UmDroDPmhVEEfTlQz4HJVnU=; b=M8rt++6eTTYC1j08ZK
	ohAxU29e9JXfAKi4N+lgWoBKJ7sButBmrl1OG9+AxAJMUL6V/sdBKL3tsVv9lQIE
	d2ufUxXIl941nqKYMngMibqRRUpg4c6sVDcpfVTmiK2GmlZwmi0ausyTJ8bKwKQi
	m442uUCFOvzmexnyi6XX7+A51ATLzpXVj074YKT2AqbfJJeBBfgzaybCKItcL+wr
	47spdPgzT/ynwbf67tlwkCEU3TuzreDPLFPBePXK75d0CfC2jU+9yXKa8Cq34UDv
	9RJxc0UZvJT9Tqt4XcN1AU5GDa21c4At9qodr03G54MeG0do3vJHbI53aQHMwH4y
	3wug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698331059; x=1698417459; bh=AP8v+9R0WrLVW
	BhLRKm9UmDroDPmhVEEfTlQz4HJVnU=; b=EdV2l51B6e/QASMdncz48I39lBDvg
	UEKh2kXV9ImwaE3vqVSN5DNhG27bacvnsc0bDrye6bJHfOGu4R2h5dVTpeswn35X
	0E2Yr70ly1tk81YwKwO2URJRNc5/R2QQ3fCZlZjYupOVxzyIz+3ZYX1TEOsc3y8A
	09vpRNX6wj2/SQvOi77kCFwgXT25JCrNFLCX7jKz49PtBBw+nx9gTVyGiI7nzyUa
	mGZ8kEFakFMnHAflO9TriRKtpDIARLV+9EpXGAg+HC1rFJ/4FoNJd5HNInnDXYLa
	TjeVAXBC9rPcA9q1Z9BA2gYXIYCIY5ev9Pw7da9VRilT0DT49APvWNbdw==
X-ME-Sender: <xms:s3k6Zd4uSf4yZTQw5MapamckErRvpOf7FQ1Z9YkbbccSzm2J0aKKqw>
    <xme:s3k6Za6E4gUiEI5eBlb4zG-7uPaY3eIbAPOGWCNXTsVXugeKlN1cELX37vSBYWfHP
    VIJuDhuGWAm_xKyJFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledvgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeeujeeffedvfeehtdfgtdekkeefleegudetjeegtedvieduiedvueduudefieei
    gfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    rghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:s3k6ZUcqbzBFb2GxA4QF89fQyMuSsPXecXSvaNgShN5YiubpfHagFA>
    <xmx:s3k6ZWI2qE_4v5lVUEssmyY7y_hK5bL7v-nQOShMkHtGvxxoXoUIsg>
    <xmx:s3k6ZRL4FmY4raZq383JDeufch5p_uj3fwtSeHxcNnOOS5w2k80FxQ>
    <xmx:s3k6Zfh5aTqtZq8jrRzzvACkgfCwcPnJTBCo-74-cZSuFCmXuW15ag>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 09C7DB6008D; Thu, 26 Oct 2023 10:37:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <dd4bf45e-2ef3-4975-904d-f72c3d4af7c7@app.fastmail.com>
In-Reply-To: <202310262151.renqMvme-lkp@intel.com>
References: <202310262151.renqMvme-lkp@intel.com>
Date: Thu, 26 Oct 2023 16:37:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "Amir Goldstein" <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 "Jeff Layton" <jlayton@kernel.org>
Subject: Re: [linux-next:master 14416/15220] fs/exportfs/expfs.c:357:5: error: expected
 identifier or '('
Content-Type: text/plain

On Thu, Oct 26, 2023, at 15:49, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
> commit: dfaf653dc41557548b2e75e6cd837071f7c63289 [14416/15220] 
> exportfs: make ->encode_fh() a mandatory method for NFS export
> config: hexagon-randconfig-r015-20211224 
> (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMvme-lkp@intel.com/config)
> compiler: clang version 16.0.4 
> (https://github.com/llvm/llvm-project.git 
> ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMvme-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202310262151.renqMvme-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> fs/exportfs/expfs.c:357:5: error: expected identifier or '('
>    int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int 
> *max_len,
>        ^
>    include/linux/exportfs.h:286:33: note: expanded from macro 

This bit is trivially fixed by allowing the protoype to
be visible for CONFIG_EXPORTFS=m

--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -314,7 +314,7 @@ extern struct dentry *exportfs_decode_fh(struct vfsmount *mnt, struct fid *fid,
 /*
  * Generic helpers for filesystems.
  */
-#ifdef CONFIG_EXPORTFS
+#if IS_ENABLED(CONFIG_EXPORTFS)
 int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
                            struct inode *parent);
 #else

but then we instead get link failures when the callers are
built-in:

x86_64-linux-ld: fs/ext4/super.o:(.rodata+0x11a0): undefined reference to `generic_encode_ino32_fh'
x86_64-linux-ld: fs/ext2/super.o:(.rodata+0x3a0): undefined reference to `generic_encode_ino32_fh'
x86_64-linux-ld: fs/fat/nfs.o:(.rodata+0x120): undefined reference to `generic_encode_ino32_fh'
x86_64-linux-ld: fs/ntfs3/super.o:(.rodata+0x2a0): undefined reference to `generic_encode_ino32_fh'
x86_64-linux-ld: fs/befs/linuxvfs.o:(.rodata+0x240): undefined reference to `generic_encode_ino32_fh'

Could this function just be move to fs/libfs.c or similar?

      Arnd
