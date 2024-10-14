Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE17E574;
	Mon, 14 Oct 2024 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728908210; cv=none; b=NKjFhE4ywgt576++RZ+FMdTaZXjrlup9Jzzk87sOF362Fawdb/IRQP67tEMs+qve/Y12mQaHby7RKBGb0GpAUrGRuQpVO2srkxcyxv0KIo9+U9IG8T7LH5s+f2sGOcIPG4rhD2PEtAT0AIZKyRG6yEYXSFBsOPZDg99YlFfxtUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728908210; c=relaxed/simple;
	bh=/t+NgTaA1O61+C6GOXGVB3E7nwGJQe2W1TYCLhCGnH4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=GP9+aQ6ZA8xT3LO1aoFlLYuUQlGRZH1tg7/MOqfXbGn3pwkjohdkUrDehD03SYCYYwDdrkMDWOzDRcw+D/TWMBTPKOucwChHkSUqLn2FgrjWOaXtfnr8LDCengZkbiidbyQnD1+STH63W25fmGJHnHqaeKCV2gp9EeuvxUkN+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=phcAFiYv; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="phcAFiYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1728908200; bh=4HCykBH28vledngsFUmD4YXkYerFdTE4qgvqgqxi7rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=phcAFiYvsSaNN53dvG0xE60pxixBaLvelCV3pMKVdMKMpGNfDMckFloYK3VgXsAAI
	 jrYFvI9Ff9nldUv0rT703h90Ii7IlpGvbM3GlK/aJSLMiT2l3ZdJr0BVo9LBc+Fnbn
	 UhFNQK/qCiKheF03rA/Wf+mqioubseUOSCd+1UtU=
Received: from pek-lxu-l1.wrs.com ([111.198.224.50])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 425A6A9D; Mon, 14 Oct 2024 20:16:37 +0800
X-QQ-mid: xmsmtpt1728908197tdz7iw01b
Message-ID: <tencent_52D2C2064D49A96EDAEECB8C93A7C486C906@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9EjBHd0TTbrm1+xYycH76X0HNjKDgqNQ0LRu0Y/SnxSrCy2/NMQ
	 r0TGgE/ADXODk/BAt6kCBh1StYOnPTi7rjaQiJAQ9+vw6uvxLyVuMNP5+txXCUtbqd160JuLdpEC
	 k4x7eE1WjZuNP0h9t8Pzm3A1ouWMKFcAYgztPcmItfUfMdKfY6+nALvXUkGVIqjQ/iSCy/TOb5aj
	 88pQMrDzUAaYDGZ75Ew7HPGTd1kqihFGOH13+rwg3dZU6rWlUB+GzYbgAj7ANfmhP/Ku6+OQLPB4
	 0vRJh76U4RAIoxl7dlpfSSJRQm0XL4k0hh1K02pgESLaTWBXOZ3ce9bjRvgDxelIOQcv+JJ6Ht1d
	 Qoi6k4wW7CUtXpS/s3FecjiB48rBKgGyl41Z2xAb+XOibU8SqulbDxC4HdI+tTW9ACZAP0YR29U+
	 7woqbxl27H0HPdTd21mXvb+XPCjiVNB4CIXT6WE8KWDidlFTMEjAZqpx/dVudbQ8z0In48UUlWU0
	 2ucJLU3Sd62iUvHFTLliBorT6ZALY2+668d9gqliKqQQE+7RTflMOEjE8/vSQ/e9gxvJaxWq0o6L
	 ERgeGV3myGI2W9hOLemHOO3Y5kVyfIiqTKRcQ/t2dzmjgOPb7FX04Nl1BnOFHTxuDqRieyFMp05Q
	 eb151k9TXOn/l3A09I1w0an8Fyw+SUar+Mn/0C5tV0q+P7HTZsg2bF+ig5l4XXJeM6ZXNk08SQGm
	 88pNgbC0wbB7986ZgLNjR6o/VSSbEe6ADOSE/ZF72GP/O3MYl8H7FqcpkaU78itf/0JitXgicXo8
	 vq20fljUQG7uaRyb6pErP7EJPGMradqZcAdC8MMurFvAjFgmdCKLLR4I7Je7GUeTtcDvPHc25pOt
	 4dRhX9me67qFuU8iMmuR9Blpf7KLzq3nkYyIL2C8BwlrR/t7nAHgKakUdXXifVVux3VK6kWMKkLC
	 4LojNhLuPLoXUlTyt5vTv5jRMbUEOxuTAtsr/4StmSt+iANaMyoQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: lkp@intel.com
Cc: almaz.alexandrovich@paragon-software.com,
	eadavis@qq.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	ntfs3@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V2] ntfs3: Fix WARNING in ntfs_extend_initialized_size
Date: Mon, 14 Oct 2024 20:16:38 +0800
X-OQ-MSGID: <20241014121637.3511987-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <202410101748.6VtnyCOG-lkp@intel.com>
References: <202410101748.6VtnyCOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a WARNING in ntfs_extend_initialized_size.
The data type of in->i_valid and to is u64 in ntfs_file_mmap().
If their values are greater than LLONG_MAX, overflow will occur because
the data types of the parameters valid and new_valid corresponding to
the function ntfs_extend_initialized_size() are loff_t.

Before calling ntfs_extend_initialized_size() in the ntfs_file_mmap(),
the "ni->i_valid < to" has been determined, so the same WARN_ON determination
is not required in ntfs_extend_initialized_size(). 
Just execute the ntfs_extend_initialized_size() in ntfs_extend() to make
a WARN_ON check.

Reported-and-tested-by: syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e37dd1dfc814b10caa55
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: typo for ni->i_valid

 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 6202895a4542..c42454a62314 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -178,7 +178,6 @@ static int ntfs_extend_initialized_size(struct file *file,
 	}
 
 	WARN_ON(is_compressed(ni));
-	WARN_ON(valid >= new_valid);
 
 	for (;;) {
 		u32 zerofrom, len;
@@ -400,6 +399,7 @@ static int ntfs_extend(struct inode *inode, loff_t pos, size_t count,
 	}
 
 	if (extend_init && !is_compressed(ni)) {
+		WARN_ON(ni->i_valid >= pos);
 		err = ntfs_extend_initialized_size(file, ni, ni->i_valid, pos);
 		if (err)
 			goto out;
-- 
2.43.0


