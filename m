Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F7213B2A5
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718396415; cv=none; b=BDS5hmedZqZpUlosrchjuwU2DewnM+fnnYfAG/pbcqJud0TUl1pcpANZlwDX20g4kbvOPeCwy7OgPqz+4UbolSQcROWIZMkaDEtr3/+0lo7h1aOe+RdeGQ/j5ZBFC+f4U6cg4Hl/9b8K4Toz6b9thkizoH5sOfLg8plHIFDE2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718396415; c=relaxed/simple;
	bh=SL3LXdGpVn93N29tSyCl+OiuXnNiv14zHiXAfmhinnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcTo6+/2aVhK4uuSj5QVNHi0Pom/VjIPgbqZOy5C4eOWszv3paP69w9bqxM4IsK5JVMo4/LncWnsBPxm1AekAA8e4pXSiUEEiFiFbs/TMIalPuXoggs/dGZOcqZs95MicjR7adEKgH2TKjcUlU3BHNbo+M2s0lAXQw1+GdYxidY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGhYvlAZ; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGhYvlAZ"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-80b8689775fso843944241.1
        for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718396413; x=1719001213; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CUAuynBVyz1fHYaZykoo5xpEFYTJwiFVf5avH/YD40=;
        b=lGhYvlAZWYjdftcrLFYahJBH9N7ZnsmadFw4aeRQAayrRtT8xoSN0zKWu6RinUORBo
         NbSapONL/tjoJYEQSJqPEjiZFLY6W6L+1tiU0/mhoek05Y1jUCd5TOI6EAbip8GHYmv+
         amWoiNSgCC8Wwgyp+IozjpjlrCoOBMAByeg+0/Id7P6Xdp6o0u31tHyeouFKXIr0Mj6g
         l8TeQ408YUCnBz5wZ3pz1gZ/+TpNNypZ5PfACNdN/H/yyjW52k0kBzNH3UPEYByf0hWD
         wwh0+2VuZKxXxaLHxnTgo2DmKRo3N3S5z3ZixcG0QUc7p/gKsuFY7UHcD8NJRk5Rl333
         Onww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718396413; x=1719001213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CUAuynBVyz1fHYaZykoo5xpEFYTJwiFVf5avH/YD40=;
        b=guq+F4BnjK28Cy/xMCyawrA7CxTq30fLUFzQr/yonKXomfOSzWgcFmj65UH5Gv7i0E
         oP9sll4jVXEv6IGZhlFzwEazLIxko4wq3ATUUQWQXZ82PZ89xJbfvVcS//QseBzoId5o
         Cc/stLeQYdmKkXnr/sysQt/+JEurJeyW0/w5hwdpIVq2/1XoYG6WyCpHQMAO/v1HFdba
         YOm0/zGeMi3344PUBcIi4dI61jG85DX4DhqrSPBnABr67O7lFrOrtyvs9uJNEZN3qy1H
         GnJ/wTuQY8cZA5DPw8PzTgomwZLvr6dRkM/1aJKPh73o5RkNzARETYhOP5X7Hw7JaYs+
         7e/w==
X-Forwarded-Encrypted: i=1; AJvYcCXvzPutaFoXU2gzfpcr/cV/lcOsgCH77rgg/ZHdyFX48H3P2OaxSFM2exbxiYqzhmnhGU4O8JdP0sx8c4u+EEx6gUMRag==
X-Gm-Message-State: AOJu0YxM8kLdG6nJWOQvPMR9qbiTvMEPQtd09L9Y0ps1QqtIoWhP9RXo
	C1dpcdSzMv4Iw2XjvNYUI0c2ks20sTw2QS9yMjcy5VzZdfIz1yOy
X-Google-Smtp-Source: AGHT+IHeZPt+coJs0UUjzvIRyH7KLBAHbOKzSy3UT6stagMTqVFlSqoIJw6X4dKYtBRry1sNMWpzuw==
X-Received: by 2002:a67:e249:0:b0:48d:9792:5bfe with SMTP id ada2fe7eead31-48dae34a5b9mr4308573137.16.1718396413309;
        Fri, 14 Jun 2024 13:20:13 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe69dffsm176912385a.126.2024.06.14.13.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 13:20:12 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id D8BE1120006C;
	Fri, 14 Jun 2024 16:20:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 14 Jun 2024 16:20:10 -0400
X-ME-Sender: <xms:-qVsZn4233Bg4h8CYciH-FYwf6Gd12xjqfEGsTdjl6QA5jiAcw4ReQ>
    <xme:-qVsZs6DHWLHgvPwKH4wyGRTfgSw01mIhxwTBlTIOJkXTp3HWoLZV6KFbALJxxSMK
    t1BbeXfZ5y4dvV26Q>
X-ME-Received: <xmr:-qVsZueKRGiocyoZPU9yTmkb-TzOXfOx9x7K3UtbwfYZTdsWmddqC-r9yBoD9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:-qVsZoIa0p0SKpKTSsAdGKByO2AuK-qzOcW7xWgZLMx3YekiPfSWaA>
    <xmx:-qVsZrLZYV6LKYERiZtQkYoB6vb1NFvDsznJ78aIyxbfmnzIfp1Juw>
    <xmx:-qVsZhw5PqYPcfLuoSIZmOxvOfNIIe3xQJU3vf0n6hkYt2nxA0ftpg>
    <xmx:-qVsZnIKOxAH2U6xyQmhe7kWJruyFTswUX4up4tIPdDPv0C96gCLOQ>
    <xmx:-qVsZmarTnrWkXSGtpILPx652VtRHGbOAmhFWRu-w1s9q7OeOT1evxcf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 16:20:08 -0400 (EDT)
Date: Fri, 14 Jun 2024 13:20:04 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
Message-ID: <Zmyl9OHjIarJIIYi@boqun-archlinux>
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
 <20240612223025.1158537-3-boqun.feng@gmail.com>
 <ZmweL12SL7Unlfpe@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmweL12SL7Unlfpe@J2N7QTR9R3.cambridge.arm.com>

On Fri, Jun 14, 2024 at 11:40:47AM +0100, Mark Rutland wrote:
[...]
> > +#gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, ty, int, raw, arg...)
> > +gen_proto_order_variant()
> > +{
> > +	local meta="$1"; shift
> > +	local pfx="$1"; shift
> > +	local name="$1"; shift
> > +	local sfx="$1"; shift
> > +	local order="$1"; shift
> > +	local atomic="$1"; shift
> > +	local ty="$1"; shift
> > +	local int="$1"; shift
> > +	local raw="$1"; shift
> > +
> > +	local fn_name="${raw}${pfx}${name}${sfx}${order}"
> > +	local atomicname="${raw}${atomic}_${pfx}${name}${sfx}${order}"
> > +
> > +	local ret="$(gen_ret_type "${meta}" "${int}")"
> > +	local params="$(gen_params "${int}" $@)"
> > +	local args="$(gen_args "$@")"
> > +	local retstmt="$(gen_ret_stmt "${meta}")"
> > +
> > +cat <<EOF
> > +    /// See \`${atomicname}\`.
> > +    #[inline(always)]
> > +    pub fn ${fn_name}(&self${params}) ${ret}{
> > +        // SAFETY:\`self.0.get()\` is a valid pointer.
> > +        unsafe {
> > +            ${retstmt}${atomicname}(${args});
> > +        }
> > +    }
> > +EOF
> > +}
> 
> AFAICT the 'ty' argument (AtomicI32/AtomicI64) isn't used and can be
> removed.
> 

Good catch.

> Likewise for 'raw'.
> 
> > +
> > +cat << EOF
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Generated by $0
> > +//! DO NOT MODIFY THIS FILE DIRECTLY
> > +
> > +use super::*;
> > +use crate::bindings::*;
> > +
> > +impl AtomicI32 {
> > +EOF
> > +
> > +grep '^[a-z]' "$1" | while read name meta args; do
> > +	gen_proto "${meta}" "${name}" "atomic" "AtomicI32" "i32" "" ${args}
> 
> With 'ty' and 'raw' gone, this'd be:
> 
> 	gen_proto "${meta}" "${name}" "atomic" "i32" ${args}
> 
> > +done
> > +
> > +cat << EOF
> > +}
> > +
> > +impl AtomicI64 {
> > +EOF
> > +
> > +grep '^[a-z]' "$1" | while read name meta args; do
> > +	gen_proto "${meta}" "${name}" "atomic64" "AtomicI64" "i64" "" ${args}
> 
> With 'ty' and 'raw' gone, this'd be:
> 
> 	gen_proto "${meta}" "${name}" "atomic64" "i64" ${args}
> 

All fixed locally, thanks!

Regards,
Boqun

> Mark.
> 
> > +done
> > +
> > +cat << EOF
> > +}
> > +
> > +EOF
> > -- 
> > 2.45.2
> > 
