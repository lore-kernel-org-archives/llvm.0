Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6184E3002D3
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809573; cv=none; b=DMUrRxTzUsJvb5XxTP+ElpWXU8pLvzZzIRfIel6QnLJv7TNOj1lbp2k/k/cq9azbso+rfXEGeQ1+krX2xiu1MzxBnlzF4FmU//q50c4uje9TiCvWIi9OmlUkWRg+0CC43juqcPTWQBoPJYlBy+UQzJhBAf1z/V3r3ylt6eEZozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809573; c=relaxed/simple;
	bh=tThvb3NWkM3msr/ABoCM1JnbhTAqdV/nFrTXflsMRkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ie/H7sjITPSsZBCMrGUapLcktTV+RMIpE2F7GmujLJ8JgNJ8UVy1RuUvDfkfnl4OpKsSavVyfQsr+Nw3KwmzV91h6yKZiW4jWbVikECUti+EIvVNT+bqgSYwadHgDlyJB8k/MyHwr/9sgQCpBymycOSMiLyjNniy15lcz0ZduXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar8BpAzF; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar8BpAzF"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7946137e7a2so52933456d6.0
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809571; x=1761414371; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GrnMpI60PzKwG6+cJ/Jxamo/bOJKX+J9SwLV1KKddM=;
        b=ar8BpAzFWVx1nOjJdhKwWHptccZgE2hpO1J3lZLtsRYscxHtG9Al7wctxYbGfr6dXU
         l841AoVaC6X6784f/uk/1uMj9QLLgVttDUOxLAoTiUsgjnEXSvIgxnNamlu8HYg6+WBM
         1tWn+5lr+7fCGF0TlbdbsLdTi7R236XfCZa3kVfXpphd/JdSZx2AQ1CCqYDtYY5W2p8b
         pflmHJB7aYSghUDhexk1wXomnRa81A9nht3yQo+oa5tPDLNTumyOTGvm2zgMHNlaeiyV
         pSuxMnotASYw2Sqq1vZsp3LaV3cc1ltYRKrgdhjdzHaCtZTnDPAntbnbSFgtxZgofcMV
         ZjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809571; x=1761414371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GrnMpI60PzKwG6+cJ/Jxamo/bOJKX+J9SwLV1KKddM=;
        b=WkSTQqFyLzi2H+WLEnBf+fVjAd7CTQH0gOcBOVB5E2SEOKayE0MJIiQb49Xe/3uq/P
         SiAELrtb2ElhfHkPRkAqJunOTpA+g7Jhy0XhCd0jJ/DHaCq1Y5agHIP5GRt4usXvp2FA
         mNePg3pk7/634JJmZcHDda8+XH0mU50d6VaBQGT2KjbpKr5z71KPLfzjONlAaJYHOyTV
         1nsPuWRQac5RdIN3ljcj8U7V+wOyKgnmMDkpZW0U6nF6pmWKbfwZnOYHfeDl1cSQRG1P
         etf789s1bZ+zIe8BAefSjafDh/38wAKBEXPoAp+yhIAQDrSSeO2Eh3gKigEeMJeC4ymI
         eQLw==
X-Forwarded-Encrypted: i=1; AJvYcCVuGY+S6FFz236DKdIypthAX/lhp8xCwif7SKhpcN0oO+SFWCIjDTO42ZPn/JgnUfxiUEBM@lists.linux.dev
X-Gm-Message-State: AOJu0YxnS6BrYOM72P0Pw8KjFdfjmrAFMieLvR2+2MbFTnY8EMz9h2Dn
	jqjuHPYlVe7qXAoYgH8+165eNmMwV6BZ0QAwITdeA7cPOXsZnvmnbxjq
X-Gm-Gg: ASbGnct85IudmcxRjoLpUMYdO22iZIjr9Xvh2uu50svw/1EkxBub0zRN3is9YWUki/C
	3Ijj4Vq11w/fH15Sr79UV3rs4M2lFgwQPGHswVRz5QKEw8pv+fICS+jWjgYMB470QTNb4sShY6L
	mMDxFmbXFAeD+MEy37uflQXcGqWiHMIFte3WB7NfUMAgrQlBiO31C/DrV4KA+6tI/JjV2tZS7Mg
	7kkrxWsOKu5/XDj4eCJWbFvzT94OXKRUPDTYEWQleFRdJqd3SD7nNnooXDDAn57th36v73texe+
	s47LfXQl3c+lhf72Myawxu/AQO8u2DAC6UFzqTQH6FUQUIQxiXqoBwewb2K+RBRa/TmXH3XNVA0
	4I8OMpNWSLZnhe2ks6KqnLZodFWTgKR2/FgwoxFBo4Cnnjs2nID8OfzNpVJprswMVZzwzzvwGrU
	kp9VAgOLsTemfOAZu55YZfpmmyIgvbFiKAbSJ+kMWMes8SuhXhruokB1DyidcXIHvpQE5S5hBtV
	GtWh5TawimfzsbR7v1pGZveg2MXH/ICdketP02v15Pv0nu9bcr9HYSdue9rAd0=
X-Google-Smtp-Source: AGHT+IGZpCN4j9tmhaYbhdNdOMD/u+TXfP+iW99iy32Lbo2Vps7+kQzJb2YNFmaLWQVUUZPeDTJH+g==
X-Received: by 2002:ac8:7f0b:0:b0:4d4:4a2e:531a with SMTP id d75a77b69052e-4e89d29ad47mr112932081cf.30.1760809571213;
        Sat, 18 Oct 2025 10:46:11 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:46:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:22 -0400
Subject: [PATCH v18 11/16] rust: opp: fix broken rustdoc link
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
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
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=760;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=tThvb3NWkM3msr/ABoCM1JnbhTAqdV/nFrTXflsMRkU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBU9F3MfxxHsWXZNGSoYZmn2+0JKsH4AOCWoX3y57VzrfMaGPAHTAxZv38DFnb0J2kyhK3EDxZd
 2sBHoMwBFnAM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Correct the spelling of "CString" to make the link work.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/opp.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 9d6c58178a6f..523a333553bd 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -87,7 +87,7 @@ fn drop(&mut self) {
 
 use macros::vtable;
 
-/// Creates a null-terminated slice of pointers to [`Cstring`]s.
+/// Creates a null-terminated slice of pointers to [`CString`]s.
 fn to_c_str_array(names: &[CString]) -> Result<KVec<*const c_char>> {
     // Allocated a null-terminated vector of pointers.
     let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;

-- 
2.51.1

