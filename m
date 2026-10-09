Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5718859B
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508925; cv=none; b=W0cmBl/ZHWMsPcL0M5FlbUSwRQtdIDhH5FZ/HyY05lFN8q24ar2cVMajVl4yNwOjA8LHtdl43ulGGc8SjopdPX8LVK6SaQm+reEGXyUox4R1X5LntFdksG4mPWK1Qx18IFqfgZZ0RfQhMQnhS1jYJQ3Wb8oMwKgbIiig5/n0bug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508925; c=relaxed/simple;
	bh=/giPkOM8S749gAdpJ+SHhYNMnuvXU63VwSMR0eGe8mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndp5yeqb7Yht/H7eS0uYgqt1EDapE417qhbpw67qcgtKNkRalaM+cg88IlvPnTxowyoEeBDFrqHMylwBQxuPQgy/TBMdCfgJUQyND0b0+rjIhLtE9Mqi8H5xWNRciNQLMQCtZEZY7lhH9iZLHDq+pTs38s/RtP0HggvMHXU0rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPVBPeMm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPVBPeMm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a01933b584so32757045e9.0
        for <llvm@lists.linux.dev>; Thu, 08 Oct 2026 18:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508922; x=1792113722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=RPVBPeMmX9HGROblPhzuFuePXKChJP0U4eZWrLvYEiVLWOxLkPqLS2r7eMTwoqR9oo
         r36zSN0wClXg4TVDbrKpfUixNfTDrm9dBrGK0gOHnGkSTkTYeH/Vg5X7dPXXnGJW9nNh
         /f+YVrmGGVtC4ZjMoMwwDc9Avvv2uHQozZCftnV7M61BK7cjZVzYGzf4XDLzNkQ21SP5
         D8JUI6h2LPMZZzYLBqyri3Ye0vQDqDdApS9nBKWdRTz+/8rD2Q4rfylV3ijQzdBr3wf6
         xrS1p04XFOVGUQYGix566vFrZw/UXpo571GalqR52Xn5ElSVYxMReajjp3ljSSgd8+/i
         z1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508922; x=1792113722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=T6SGPV74APJL5V8wNBptwHA9EemN5wvYhHPnuYMf4mJ5cmQ+nLvLgvJhFPBQc4Pc1k
         dNdQTcHT8J4QKEKm46Xv1X1NPVLKSCrI2OXOmYumJOHKHwWv9LOKw3hiWLmp3SjUsfzi
         +uA3IFwwvimZCNgDp04C+3/rcVgtvwogQhxbO6IyBGa1p4gB+sKJmfd1wM2JVRTowvF2
         q8GwGpqraWbGwhOPpkpORtg0Y7MT5QFd2bt1TP/9665RrYYdkLthm3S9v6U3ePytzIji
         VmHBKKgTQxnRt+Q2XHxwgu4JtH05R8Uup3B709ZwvGPBXtDlvRDNnQjPEQwZh//Cltq0
         POJg==
X-Forwarded-Encrypted: i=1; AKwUvBw7sSoriSX3SAzGc/ao7pwvTiRfmGPrxniUNlqBTBLtOg9yxtUJYwLY9YrKxPGCGUvCqd8w@lists.linux.dev
X-Gm-Message-State: AFuF++kxwS2wSjuTzSAyIhcdq4kQ9RPcpAhd3Rf/ju67vKF+2OtRIV7D
	QETHHfvofyU2vudcJzgnjcgBp7sojlAlmMDhg0j5Uh2tAXYoA/POirlR
X-Gm-Gg: AYBFou3M4TsOCepCwhHKyVggC+AHVsf8DdXHNSbxKmlPdi12wkDuOgDQhjYSRfSAyT4
	ERmmOMBiiwIhJX4xcb6+2vRoASTM8/VR1tYQl5B/T8Ux03k9KzRqvIVaZZMTHgPqelJnHiNjFlX
	jsovDG5cpM7eoMQrjI5KWD55dw/h2s2ov78geCyAOlrZmmKLynITQlP9fBAlqsvgjO0jyMYN3WO
	e0DCgUwIxh9tnWzHPxCPEtPBYb9kcm99j7ZiLbBXvq/O0XL1io/XBFVtYhwNHq6bgV/mORZDEdq
	PjjVtw6Ukbw5icRfXV5pyVb5Wj/K0rhnPYulPp1vJwTwpwSNtAS3a/SRZVe1/Hg/U/qorMBS49L
	/U1cBUWv3M8LGgzyNi6wTR5nO24s1YpzxfAdZpjwruDAMJ/CdXrnvSD6KU8+fNioAUMBce6K3QH
	IiCCkMeR2+ukPlPkRIuRhmPY7NX6eIn551kxMdQ4mwKcKAnMzch6D9yoGWpX+wWbSVXl+e72+xv
	dReQfC1B3KCcp9b/UlpPLbhPogXDKIoX/xcU3di2+WaItcTFIbFGBtB13fiGpz7sY7RTebae/3t
	UOShcXsl6vn3gBQ2q2zjlbRRUhs2qYJdJ5MPdOOH22org+1a9naDxtJtckephePPbFW0yhQzXfE
	BtQLcRU0ggrautJauSae9thbXHDA/wEc6
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr3757845e9.7.1791508922467;
        Thu, 08 Oct 2026 18:22:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm1207925e9.2.2026.10.08.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:22:01 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:21:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Message-ID: <ashAuRn5eT2iiMAk@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
 <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>

On Thu, Oct 08, 2026 at 11:08:52AM +0100, Gary Guo wrote:
> > +=============  ================  ======================================================
> >  Architecture   Level of support  Constraints
> > -=============  ================  ==============================================
> > -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> > +=============  ================  ======================================================
> > +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> 
> Can we say "ARMv4T or above" or something similar?
> 

Plain ARMv6 (CPU_V6, ARM1136r0) and ARMv7-M stay excluded, so "or above"
alone would cover too much. It could be

  ARMv4T and above except plain ARMv6 and ARMv7-M, Little Endian only.

That is longer than the list. I can change it if there is a preference
for this form.

Thanks,
Karl
