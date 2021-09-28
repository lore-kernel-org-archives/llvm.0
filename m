Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AF2FAE
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 10:40:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E1BA61130
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632825633;
	bh=VxXQaJBe6UecTA3nVtoqBtsl3L0uZUDbEZHfXcICPUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fXVBw6tcetmUU1BiFI6T7YBw8JNQ0CA1hbXU0svE46k0FHlOuw/MnWOFbVfJMp4OQ
	 z0V+IxR8sGYK74xe8ewbv9SdjgJDAgu2V0K2GVSE8jaKQ594zYzy2/dayhzl01La67
	 lDPc+ErZvR3kbnlJT/yLoQKNu5olWAAWl8Z9xyAyZnL0QsbMf2Ps7c+bwLmuannwhj
	 WX4UbCEm+pe+6rh4ibzErnVPH+UBz2oYNm2IDwNlqUuSZWcAUsWrbktGjRL1SK1x45
	 kFCMlcrcySd8KcIkfcN7WDBcJ1sNbaANOR/zNtS9G/iMEsOnI3wn/41smuHaqkZ0N2
	 /ZP3IsisJFfbQ==
Received: by mail-wm1-f49.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso2404480wme.0
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 03:40:33 -0700 (PDT)
X-Gm-Message-State: AOAM532Ne8ugS/+jR0L5ME4eW6PPWP3qJvCWEnfWiS7kYrSidExp92e+
	RnzPbHoW2XSAEMtlMXlKt7VbWinLKanHCOFD4BQ=
X-Google-Smtp-Source: ABdhPJxM71b93hCZd3TzbLqYpIKM4hHy9QljjdwUn4uXnE+eZrXsn+MVP6e1rkEC0rsOJYRgfximYvHM/wLc0c6+ibs=
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr3883570wma.35.1632825632037;
 Tue, 28 Sep 2021 03:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927094123.576521-1-arnd@kernel.org> <40217483-1b8d-28ec-bbfc-8f979773b166@redhat.com>
 <20210927130253.GH2083@kadam> <CAK8P3a3YFh4QTC6dk6onsaKcqCM3Nmb2JhMXK5QdZpHtffjyLg@mail.gmail.com>
 <CAHk-=wheEHQxdSJgTkt7y4yFjzhWxMxE-p7dKLtQSBs4ceHLmw@mail.gmail.com>
 <70a77e44-c43a-f5ce-58d5-297ca2cfe5d9@redhat.com> <CAK8P3a3sEy7NAhMHcV7XPpZxo5tHnQz1oCP43YTe_ZQuzOHgPA@mail.gmail.com>
 <42797736-a64b-e244-136a-d4526b732a50@redhat.com>
In-Reply-To: <42797736-a64b-e244-136a-d4526b732a50@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Sep 2021 12:40:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2rMbLJdk4m7Kn1J-FfHZeR92wb1Ux8EEz4d2=5SOB9rg@mail.gmail.com>
Message-ID: <CAK8P3a2rMbLJdk4m7Kn1J-FfHZeR92wb1Ux8EEz4d2=5SOB9rg@mail.gmail.com>
Subject: Re: [PATCH] vboxsf: fix old signature detection
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Sparse Mailing-list <linux-sparse@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/28/21 12:11 PM, Arnd Bergmann wrote:
> > It's already upstream, see d5f6545934c4 ("qnx4: work around gcc
> > false positive warning bug").
>
> Ah, actually you mean: 9b3b353ef330 ("vboxfs: fix broken legacy mount
> signature checking"),

Yes, that's the right one of course.

      Arnd
