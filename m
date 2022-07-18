Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689D33CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 18:25:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id tk8so11491176ejc.7
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kscGEigI+tjGeP5TvJ/S+GJp6i5Qbl+gYFuhTnzJi/Q=;
        b=jNLpuo60nBYj/0Icdd2hZbpUSg8sfsZ9aIyS3We5Dc4g3pT0DOnYHtz8yuOy7UpHLT
         eWraK350sP4poSMGQ7pY1JsK5dQgkWgOuHZiBy1m/IwnzGvaN2vSVYrI6zP3u5GMI4cg
         DBrd0Fz99DFS1vgIghLS/5DpS6BaB85bVbcU8AGZ8Jgow9oHtaaDpksygHLqZDRMlHDm
         7Xx2iKMopnIHqGYuxQ8baCVApmHSNzTR7viE3s1jG5KPEdG2kskLnK+CyuX9UOnHzC+Q
         3+EUIWSO9WCvSrx/7ZYzfu7Q38diEa+2lTj+p4tlqBMsIYzbmwhzIn5Zw5EXO2pc88K9
         knUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kscGEigI+tjGeP5TvJ/S+GJp6i5Qbl+gYFuhTnzJi/Q=;
        b=keUBw/aZ8shN8X0I0tLwHQTZDHaCzN0aPEDUxfLlxxBZNkC645S5o18ghpEI3CVnTG
         0GEGlMR1X3nb7rr0l3ZALiEU/n2igzdBVYs1mzACuTfFhs1VG4yTxYrQnFQZbChe0PjI
         4cJXCCsqj4SIDjRoromBpTftZ/zcNjCN3kRPAY6jlOHpZxOJIwNHmwtVXjG3ueDcPe4o
         JbFIiFDXmF21p13ExHTALnKmFBymSJ0eRYI47PPi5ycAYO9PHAaNfNG8LyB29MiBGU6p
         LuzoQ5YAYT4fZcQ25lbUUrP+z9Zvkbc7c2wrCR4CoTdATmySEPzymgOugcmk+MT/ohow
         kCjQ==
X-Gm-Message-State: AJIora+ReDKIB3p/WzSyr3838nQxHEpLpx4wjELwUbG+QzAkxUbK/59w
	/MtWDvH0JuIcLYu/oCXw8z8JZR/kmaxwI2KdcxUYiQ==
X-Google-Smtp-Source: AGRyM1tYPDFFiijC4Z9MdcmK3xOLLmCzQ2arChf8L8dWUQufhw6ny+XMjSmMxYJS1dMP/PsvJqboKG2stxB30MOWryg=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr27598952ejc.294.1658168739084; Mon, 18
 Jul 2022 11:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608223539.470472-1-justinstitt@google.com>
 <YqJYrImC3Bk40H1H@dev-arch.thelio-3990X> <CAFhGd8qTc-=Fjw2LZW4HYJtVyizkLhYRyv-TYLd1ji-9oR9EdA@mail.gmail.com>
 <YtWk1abYruK6DIoL@dev-arch.thelio-3990X>
In-Reply-To: <YtWk1abYruK6DIoL@dev-arch.thelio-3990X>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 18 Jul 2022 11:25:27 -0700
Message-ID: <CAFhGd8oTs1gM8C8zZvcZw0pxzRJc1ogvp3jg6TSGPVegsXCNsg@mail.gmail.com>
Subject: Re: [PATCH v3] include/uapi/linux/swab.h: move explicit cast outside ternary
To: Nathan Chancellor <nathan@kernel.org>
Cc: Justin Stitt <jstitt007@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 11:22 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Jul 18, 2022 at 11:12:25AM -0700, Justin Stitt wrote:
> > Any chance a maintainer could take a look at this patch? I am trying
> > to get it through this cycle and we are so close to enabling the
> > -Wformat option for Clang. This patch fixes over 50 warnings and
> > there's only a handful of patches remaining until we can enable
> > -Wformat.
>
> I think this change is already picked up? It's in -next.

Oh, awesome!

> https://git.kernel.org/akpm/mm/c/d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
> https://git.kernel.org/next/linux-next/c/d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7

How did you track this down? I wasn't able to find any references to
my patch in -next through kernel.org.

> Cheers,
> Nathan
