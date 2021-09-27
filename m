Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1F3FCB
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 13:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DE1E610E8
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632748926;
	bh=Das70DqAnDl+vU2D9E9K2Sm7+IL1whzT5AdV7Cv64RI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OOFnIZyHjl73BWpGX+Odm656Lyv/9q2gXQ5Nzg06FS72+jSBjAT3ye3rcK6JThKXn
	 ogfnUKFoKLZanzkbm/eyK8AX5kJqeDCFCRdDTauFJQU/n3K+RYlD4dksXT6dbd6PXy
	 eCfZivWVyPXsL9sUsyfpTVD5+9jxIC+chV2ckEWXiOquv9WPcj8YTutekB71mT2f32
	 SCPn96NDRZCYC/GDdYXQ0c2excIFUXZK4s3EjL8v0VgM5SztqdrVgMO3VED5lN79nH
	 ItpHfQLkAM2rm+RlVi/jpV/zvNo6b9x/Si1W647vCGpGji1+JviZxWTT79PrUfP9T7
	 IHQkyKOCYQVJw==
Received: by mail-wr1-f46.google.com with SMTP id r23so26581319wra.6
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 06:22:06 -0700 (PDT)
X-Gm-Message-State: AOAM532KA3g0HvBfM+l/tMoci0zoffq7SmDZ52qaV4I8+fn3c+YxAhKP
	+sKHduxuaWxgWSaBZ7EoCfeAIx7YPXCKriUtJJs=
X-Google-Smtp-Source: ABdhPJwd+GjhtNJa0Ksv9WnIRk55xwwRShFQt0ktXM1OP+lbfAd9C7QYDfCYsXPfvRbsZgn+i5G1Bmd2QLm1EhnryJs=
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr27916738wrs.71.1632748925101;
 Mon, 27 Sep 2021 06:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927094123.576521-1-arnd@kernel.org> <40217483-1b8d-28ec-bbfc-8f979773b166@redhat.com>
 <20210927130253.GH2083@kadam>
In-Reply-To: <20210927130253.GH2083@kadam>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 15:21:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3YFh4QTC6dk6onsaKcqCM3Nmb2JhMXK5QdZpHtffjyLg@mail.gmail.com>
Message-ID: <CAK8P3a3YFh4QTC6dk6onsaKcqCM3Nmb2JhMXK5QdZpHtffjyLg@mail.gmail.com>
Subject: Re: [PATCH] vboxsf: fix old signature detection
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	linux-sparse@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 3:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> GCC handles it the same way as Clang.  '\377' is -1 but in Sparse it's
> 255.  I've added the Sparse mailing list to the CC.

More specifically, ' think '\377' may be either -1 or 255 depending on
the architecture.
On most architectures, 'char' is implicitly signed, but on some others
it is not.

The original code before 9d682ea6bcc7 should have worked either way because
both sides of the comparison were the same 'char' type, marking one of them
as explicitly 'unsigned char' seems to have broken all architectures on which
the type is implicitly 'signed'.

       Arnd
