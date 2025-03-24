Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6E263F38
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834977; cv=none; b=K+1fD9KNzaK8WotXXRaanT2fw3R2LuOXOpKemvK3VkXGJd4VDJmeb/+a7EgKLoKaoaxaTY43j3JIphzqJZ2i9L3+LTFhkH2CJ1UjGLOrqqedgXcF4eiTWaDJgYDYXgggR3Jg63w/Cj8hAn2Qk9ybqIsxLxtqEKdBAUH2lWT2x+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834977; c=relaxed/simple;
	bh=1cW3XXPLhenC0aPM0QTbraRgM3ezYhhg4cN/zcLWDKc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgHalYWeCkup/L3jaB2TIH5K+yehaVDqJzT0XrWzihiz9jmX2FI13WOkfIMa4uqVM2sWEZlmN0R7LNvHB20p/IWVVRbHn11C34hwxQ5Ak0GovGKoWoBleI/vh8eUCHtBBwX8yAC1mcD0/GKW5A7a9mKYIONFy7OEG0o/B7rPToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h748YMFI; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h748YMFI"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so9423946d6.2
        for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834974; x=1743439774; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bf2kh6G05pGLPdSuj7dYJ6UhpBm6ycRh7eYTtN26Igs=;
        b=h748YMFIUcxIwAzb0yZUU2AoEE4riG/n1fiDFOxrz7jYvdhTehZ/06OzgUPPgOuMag
         Ezu/03bXZSHyWfUd0tp8au9YWoWdfYPMi55jXy7V4tSflJP3lQ37SRxcRHXp0+SiGiyl
         K8lAdvMKXX1q7wKBrpDFdS7hPNWqp5ZYMix6Kpz5mGSRi+OKILOrX1HMPNThhHjwElUM
         TztZmmfLHWraEeg0jME0/B94l55bdG0IWbs80hnTlKg2zEnkKjETOV0sf0+yNgpGwWJ0
         ecTFTv7IjJ2ZehzMIOHbAaue9CWXjKKBhnOsJA+TKpnBwIcfU6bqB+g/+NTekabOZdFN
         t74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834974; x=1743439774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bf2kh6G05pGLPdSuj7dYJ6UhpBm6ycRh7eYTtN26Igs=;
        b=rUnczOeYnKF7pbVuZipVTaETl0EBM7j8+YqkF9x4066mciPKmB1/TloUfF4F8nEjj9
         xIeG4Kne8HbjaA+o5wdT/phxIdO0iAIE1S7K3aI1TzYE+yGz2+un95PZZ+as/wYJ7WIk
         Fkn7cPv9+oIFAAMJfz1XsilaLApkLa1BhquTc6xShe6pXyyGxCwu6OH6Xy5TDIjTPFrm
         x20CLCc3v6GH8emXjyKr4dLR+ArbmPufzVcTfZOczF2hDPqAjo4v5+OAnC5sPgkWQ0E6
         TiVJsQ9rxiSvYKG4Z8fi82kVWLZB93IVrSvZwtOLlUmYAI806INFoyX0OG/lFKa8B8cC
         IA5w==
X-Forwarded-Encrypted: i=1; AJvYcCWnrUMCNoHeS1szAjsWCMLXLnZ//rbD+bCzpCaeJWqJ/PNdPLRrLRaTkMw6+LHVSucDl3we@lists.linux.dev
X-Gm-Message-State: AOJu0YxEFGN8KVUcgaK9VVmY1ddmODalQY/kq5rzKw9u1a3l5u32fh4a
	riUFgOPgJKB06psL5DXhsWqSYcpDb48TDG5azq+xkd9fpZJITyxn
X-Gm-Gg: ASbGncuS/ihCZ6/UDgHUBh4kQwSxQx/+kA6p9avejQ42I3bC9IS/g/tN+SZzn0ddsv4
	SV5IARJkpmAdsuI+hNZHxHvw+WqHcj4xsui4StNNF3fNEBurAGmM3BpUoGHnB14eQZg7ypNJUJa
	3Z4Q7w4NO9mWL891ODZEd4upp1VdoBOZuwv1G2phMSH9Ad/jMzf3w4E86ob4pmaKJipq3c6/RvA
	x+pTONc96ba3Y4q/Npo6CV748Yt++xeQA4S+DovctuaQQPkHB69VkXJ8RhxKNaKjSJ7ZCQLiCMf
	CZ6eCt12KVNT6qP7EdbwQzyQorYDyZ6NQfrG0guVkADSiaxRLwb16rKgyUy2hD0hee2Ll5DXFAp
	cLtvf83VZv0LbwY7BNJUMk0Z0PjMHH5LfGj0=
X-Google-Smtp-Source: AGHT+IF7uIUBThvsY+ZL5DCMtDH932EJZ9y8lXz+Nizlpbf5Qr1xvu8w9feQIVuqiS66Bs6YbhNFdw==
X-Received: by 2002:a05:6214:2407:b0:6e8:c713:321f with SMTP id 6a1803df08f44-6eb3f339e06mr247763406d6.35.1742834974211;
        Mon, 24 Mar 2025 09:49:34 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0eceesm46989946d6.22.2025.03.24.09.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:49:33 -0700 (PDT)
Message-ID: <67e18d1d.d40a0220.1a1e10.296f@mx.google.com>
X-Google-Original-Message-ID: <Z-GNGwN8Kv29ybB0@winterfell.>
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id E6C1A120007C;
	Mon, 24 Mar 2025 12:49:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 24 Mar 2025 12:49:32 -0400
X-ME-Sender: <xms:HI3hZ6Ieop_8G7-9NdMDSsHUixqR7Neaupd93Om_wcFdI_TT4TZTag>
    <xme:HI3hZyKz2qDOJcjciBZaqvu34CogmjdRZEyXiEwFrbasfPlgUbXiarXuV6hje97oQ
    kcjY7fwniTGgLIAWA>
X-ME-Received: <xmr:HI3hZ6spx5AvU5WKhvGcLile6HxgGoZ_T1lq7pfv6CuuuoHkMrvbBo2d6mU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepgeekgeettdelffekfedtveelueeiudev
    jeegieekvdegkedufeetfeeiiedvueelnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhq
    uhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqud
    ejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgv
    rdhnrghmvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepkhhunhifuhdrtghhrghnsehlihhnuhigrdguvghvpdhrtghpthhtoh
    epohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhho
    rhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
    dprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgt
    phhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhope
    grrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghr
    hihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:HI3hZ_bLw4zxWGG2Z5E7mtt8nF3OXydAO1yPsOuhiQRMU_tOhNnTgQ>
    <xmx:HI3hZxagqG_VmqT0vVzHga_RR_X4t0cLBZLPNhS-39Ahfebw9eDfpA>
    <xmx:HI3hZ7CJzjMNIEmsX36lbsoHgtONPJLr-0ZoCNyPLmQrNKdCSW_3KQ>
    <xmx:HI3hZ3ZRgp8DbZEpbTfKe7EZ03CXWqIwHuNAYRitvdkKeuK2xj3goQ>
    <xmx:HI3hZxqAJXWJJFCR17qdW8iyOKgUk6UvcvDUWa2mJMOofWma99U260aZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 12:49:32 -0400 (EDT)
Date: Mon, 24 Mar 2025 09:49:31 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@gmail.com>
Subject: Re: [PATCH v2] rust: sync: optimize rust symbol generation for
 CondVar
References: <20250324061835.1693125-1-kunwu.chan@linux.dev>
 <CANiq72=KjT8HRJA0NStHeqm-9286gay496CU8edNALPQ9_N+ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=KjT8HRJA0NStHeqm-9286gay496CU8edNALPQ9_N+ww@mail.gmail.com>

On Mon, Mar 24, 2025 at 10:37:38AM +0100, Miguel Ojeda wrote:
> On Mon, Mar 24, 2025 at 7:19 AM Kunwu Chan <kunwu.chan@linux.dev> wrote:
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1145
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> 
> Nit: I typically use Link after Suggested-by, to mimic what the docs
> require about Reported-by with Link. (No need to resend a new version
> just for this :)
> 
> > - Remove '#[inline]' for notify()
> 
> It is good that the commit matches the log now, though I wonder if in
> the future we may want the `#[inline]` for `notify` anyway, even if
> LLVM does that one on its own today.
> 

IMO, inlining should be mostly decided by compilers instead of
programmers, so if we don't have evidences that compilers need some
guidance, we shouldn't introduce the `#[inline]` attribute.

Maybe Kunwu has an example saying otherwise?

Regards,
Boqun

> Cheers,
> Miguel
