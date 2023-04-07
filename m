Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A854AD22
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 19:07:07 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7D7AD3F230
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1680894422;
	bh=NxU5wo4yJIlxfUu7luiA0zDVsYB5pwNg6QbXIvPeaIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=cK4CyA+nkxRjfkIiBT3d9mrBSW4AhvxF6qF0VmS2jeCqxCE5N6nZSCvxdYM0oItQk
	 XPI+qa7eKZ4CFmAvCSuDhQdVV42jOpDn3fRjYQJQoe3dD24xxrprMEF95Mrw/is+S1
	 4gebfDAIDNije/soas3vlC05HW8ETpWkM/7Ndqgl7WqgkIerYsu3P58HnDQG5M9NCx
	 VD50b4RRddr079YJl6Z47H6giSXNy7oPtMZUC9zzB+CMtod2o8dBw0zUgcqGlyEZHG
	 43peCz4R+4zawTtIiL+9YRbowTAByEkyxFBhbyY4Vv/2DoSjIvOdC4b3pdz56KNliJ
	 7u5maRzV2FPfg==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-93071a2c49dso135747666b.2
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 12:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680894422; x=1683486422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxU5wo4yJIlxfUu7luiA0zDVsYB5pwNg6QbXIvPeaIU=;
        b=44SM/SiY7+5eJPaZ7+a8e3RFig4gC32gTImrC+emH2aayZwyR1lFTanfryUFuABqdC
         5CGygUNpJcOM/ETnk77XIeyecp6Zt9dVmuYQI3HkQc9ZmfFNB1gkbQgW3hJjgm/qNe8m
         vxL3X3HnVVHONsF8Ym8iWYTmId9Vs725Xr6GO1tHovNOBzeEHkSA0GVloEFxRX9mqbGI
         DDcLW9YiaGEBAsQn4z66OaQRItcXFrHT+jpU8Y20i3t8V1g97yVVnrzwn44gEjkSOKmH
         1q6wlOYos8L0Dbm3yXFTOV3Lr3J6v7dI6p+P62bHTYdkujLHrZgnVVF8wh6+Xj8bS/H8
         rpFA==
X-Gm-Message-State: AAQBX9eTgBUMdzsbdoQ1OGGIANpwgiHX2BxS7DmRfXcsT55E+H33KkXh
	XmdIsTh+rk7pgO0O5ItaH3bQARYXccbBnVXSoasBTKQxHOAoDio+U/e14fCRTkLfcGcga/ElrlA
	SJWhCxLN8xI6MydMNSpTR5arGjSLCKoY=
X-Received: by 2002:aa7:c6cf:0:b0:504:8738:9758 with SMTP id b15-20020aa7c6cf000000b0050487389758mr639102eds.16.1680894422106;
        Fri, 07 Apr 2023 12:07:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+tYyDiSKosZ5ldvA/H/HGaVnXTlxmZ8wichKKXSZ50KMbwudz4TFE8q0RJqP9YJxlGWNrJA==
X-Received: by 2002:aa7:c6cf:0:b0:504:8738:9758 with SMTP id b15-20020aa7c6cf000000b0050487389758mr639079eds.16.1680894421788;
        Fri, 07 Apr 2023 12:07:01 -0700 (PDT)
Received: from localhost (host-79-33-132-140.retail.telecomitalia.it. [79.33.132.140])
        by smtp.gmail.com with ESMTPSA id k13-20020a50ce4d000000b00504872a5288sm163126edj.35.2023.04.07.12.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 12:07:01 -0700 (PDT)
Date: Fri, 7 Apr 2023 21:07:00 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	Eric Curtin <ecurtin@redhat.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>, Neal Gompa <neal@gompa.dev>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: rust: drop is_rust_module.sh
Message-ID: <ZDBp1PaVL7KoqOdD@righiandr-XPS-13-7390>
References: <20230407070517.204676-1-andrea.righi@canonical.com>
 <20230407175318.GA1018455@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407175318.GA1018455@dev-arch.thelio-3990X>

On Fri, Apr 07, 2023 at 10:53:18AM -0700, Nathan Chancellor wrote:
> On Fri, Apr 07, 2023 at 09:05:17AM +0200, Andrea Righi wrote:
> > Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> > introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
> > to enable RUST.
> > 
> > With this constraint we don't need is_rust_module.sh anymore, because
> > 'pahole --lang_exclude=rust' already has the capability to exclude Rust
> > CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
> > then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
> > isn't used as well.
> > 
> > In any case is_rust_module.sh is obsolete and we can just drop it.
> > 
> > Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390/
> > Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> > ---
> >  rust/macros/module.rs     |  2 +-
> >  scripts/Makefile.modfinal |  2 --
> >  scripts/is_rust_module.sh | 16 ----------------
> >  3 files changed, 1 insertion(+), 19 deletions(-)
> >  delete mode 100755 scripts/is_rust_module.sh
> > 
> > diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> > index a7e363c2b044..608406f33a70 100644
> > --- a/rust/macros/module.rs
> > +++ b/rust/macros/module.rs
> > @@ -179,7 +179,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
> >              /// Used by the printing macros, e.g. [`info!`].
> >              const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
> >  
> > -            /// The \"Rust loadable module\" mark, for `scripts/is_rust_module.sh`.
> > +            /// The \"Rust loadable module\" mark.
> >              //
> >              // This may be best done another way later on, e.g. as a new modinfo
> >              // key or a new section. For the moment, keep it simple.
> 
> It seems like this whole section can be dropped? I only see
> __IS_RUST_MODULE used in scripts/is_rust_module.sh, as the comment
> states.

In the scope of the kernel, yes, only is_rust_module.sh used that, but
outside the kernel "something" may still rely on this section. Keeping
it seems safer for now, to avoid potential user-space breakage.

Thanks,
-Andrea
