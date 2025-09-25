Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDBD272E4E
	for <llvm@lists.linux.dev>; Thu, 25 Sep 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807783; cv=none; b=Vu+bqfYprJgDPzBLOZl7HFalKl/TNZwNea2680UOWuOPt5ZEIUd89SlTBgNhzVR2Z8OLuuG6Q/zB1nzl060DZ6/lP5XeSH5HBLr2AEQn5oeAgmhQfRUPEG+sE+ZnUootzEwfsbsKKjn5HtLfrslOiMgQoBvFaAyazsKa8OJrIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807783; c=relaxed/simple;
	bh=dR7SLmVNHIVh9rfgt0UBYbJhDHgMhtv5IQldU5Oo1x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoTxbTKirdEIIZ+sCCYy6Nr2GQ6+8bnDZUxU7KG72rD1TC58qcRt862V5IoSRVhRrVGfVjlXBhTylYklCCCvilT+RjpeAgTwKLz2Y/L1YbzBi6vTJJUl9LIqcsWkNIAOsimFT22TYXE4vCJawGysb8n3DUpqZvmcyfHOfNyT14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HetoPk3u; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HetoPk3u"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so9822106d6.1
        for <llvm@lists.linux.dev>; Thu, 25 Sep 2025 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758807781; x=1759412581; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbaY8V0OL9vVXDMnnkhXlW/3PWrqVdowYDRD++oQeQ0=;
        b=HetoPk3uT4hh+lmgvNqk2gMTKmmKyPNMdK0egXs9RN7skQ9JZUgtrNagAEgoFNeJcz
         UK3ggUDFoqMmrbwkMByQDGA3tTr0TUhxeB/lnXXIEyddozJg57FephtJB+JOulCTIjra
         7LK0bpSKG0jgoJiQNo52G9TYGNGO6Jw3Gdektmk0lQ21mpsppRV7YzGvT512yoKrSSbO
         PbaZTKhnAznPyIhCj34bNe5VaJKsK5vGDisEwkLpqIq7vab+yO3S9pN/U31BnPYq4dTG
         wYt75c+ve75wRl8kRBFy74syjklQ7L60Vs3pbON4lySu/Xjb+j7GmP/ANU86ttO9VkHt
         ZHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807781; x=1759412581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbaY8V0OL9vVXDMnnkhXlW/3PWrqVdowYDRD++oQeQ0=;
        b=N+GNml95wCf6zpwXs27ltD2B+b26URreZQwhOqml5r5yEErJpz+a+pA1cTbPOZyyci
         uOU7/IIQNAY0OUMISmDjnehmzq+XB0yUdhCGmTwrRLOUCwWSlhSdiz1z4qKtLjIKBAqH
         IqHVkmoK2q6cDJRgHcNCg+fgNsfTkt2AS9ml+eFYQwgKfbyhFhqPW2pWp317JpAgZIFg
         Xneg1cI5vOCTqdhHM7fISx1mSdMRbyDzt/NpocxIHmof2KVvzufqIUy99YxtQzeXo4m/
         +jNoaCAc1TQlqdqGpiyNp4AWfxeHEEmj5M09Xzww1UyRaug2ERc2CStN5Dv0B7BaPUdp
         dGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUJxX86+U31OvQayCBgXeBQXidfgwLhTtU8Rv5z/O16mqQK7UjlsJ6YBVUDwq1s4rf1JU1d@lists.linux.dev
X-Gm-Message-State: AOJu0YwGFbCpcQsliu0JxwKcf++rjmWM0umVz8odkFaBus9egipaZOua
	JMpYpplTT/cQOgb3VCLIgF1bNJSiNkT54NAyZLOgf27ul3KmQS+iJol5
X-Gm-Gg: ASbGncsP3gUjNKN+ItEXwrFwv5qcG7ZmvmpNrpjhAk7rNtyKr/8Q6NkmELjNtGA1tQu
	nogLhSsxltXkZzs27icaIoAhuiRPFZNHzPTItGndy6c/cBxBVCUlUvTDVs1HPb++ShvQtLuvu1w
	I51wI2yjgOu0XHcRR+FoTijjJvb05aG0wK2a4InI0rRtPNmDhICyceez8I9pVLST3LiMz4CnYiL
	Z21tsDa/CglPQZ1qKYDnaGLWDuOr2qNvPVA4OEQDx4Qcp9DCN0r0WSAcZbL6NgKSxp0RnBCxsRL
	4vKRpQELyGYJUh1CShowm/yvu4e3UTv+uzKwJdycXMwczuve/+ipxV6vmsptrnA4Rgc1L5JNcrO
	XfMgKVTLJpz4jg/rBEm9OI0UPsoW7f0SAwW/0OzESlnTgBEa8KzSJMzuRW20q5tL16/TroKePzt
	rxScwSVfQw/c2X1LOOAAGhjv8NeIao+GXpei0S9mNK+uUifoB5EgSvNvkkENLWAMdw0R99
X-Google-Smtp-Source: AGHT+IHcXs/1zZiL4mRHRcJmMaysro1gRq3C6CI7WzBk8URswdICjX7WDasck2n3oTmE+fT66Qso5Q==
X-Received: by 2002:a05:6214:3017:b0:720:e5a:fe3b with SMTP id 6a1803df08f44-7fc417af017mr49768136d6.58.1758807780523;
        Thu, 25 Sep 2025 06:43:00 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-800fa5f6dd7sm11852546d6.0.2025.09.25.06.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:42:59 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:42:52 -0400
Subject: [PATCH v16 1/3] samples: rust: platform: remove trailing commas
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-cstr-core-v16-1-5cdcb3470ec2@gmail.com>
References: <20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com>
In-Reply-To: <20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758807776; l=1557;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dR7SLmVNHIVh9rfgt0UBYbJhDHgMhtv5IQldU5Oo1x0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMBRuV/ubGHi6AJrHtMWEogs+gWnxrbm2zAAbtuo9cLcfxR+ZO72SsA4+aDO80NYB5ZrsYfMwz8
 lhrWFoc//jAM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This prepares for the next commit in which we introduce a custom
formatting macro; that macro doesn't handle these spurious commas, so
just remove them.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_platform.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 69ed55b7b0fa..ad08df0d73f0 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -146,7 +146,7 @@ fn properties_parse(dev: &device::Device) -> Result {
 
         let name = c_str!("test,u32-optional-prop");
         let prop = fwnode.property_read::<u32>(name).or(0x12);
-        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n",);
+        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
@@ -161,7 +161,7 @@ fn properties_parse(dev: &device::Device) -> Result {
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
-        dev_info!(dev, "'{name}' length is {len}\n",);
+        dev_info!(dev, "'{name}' length is {len}\n");
 
         let name = c_str!("test,i16-array");
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;

-- 
2.51.0

