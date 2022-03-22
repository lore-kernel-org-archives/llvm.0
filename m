Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC34293
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 17:31:07 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s25so24941682lji.5
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgcgyCIbWUTOoVOlIFHHmtoodCzEMkbLy9TNN/VAosg=;
        b=naptp6Dpy+85YfyC34kaFusYQmU1UYYJb1v0QokmAZ/OC156PjQKVkMdUdnZTFP3pI
         9BLeqi/l8Szf7/x+NC+k5zOh+OaHrPK7DQVvX7j1X0ddioyzwX172ho1EW4NU6uncyhz
         6hpurP0vHYti9dft5+IoDbp9NQlUEAYI2/a39CHcgLqA1RcSjTKP9PVz+JaUxurX1o/i
         dQcF73IPVJJzlJNzFBqx6dgxQ1rdRuNZpa95I9GNHyCn5URu2yNMY5c3IULf0R4b7K+L
         z/d9txrBGCP43dBC1XnY0T22CnvkA+y2QQlGIZczuT0NmwRQnJAl9O15bUplsLBFEHSZ
         QB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgcgyCIbWUTOoVOlIFHHmtoodCzEMkbLy9TNN/VAosg=;
        b=02b9Qik4ZvnwB64obmb6bLGUEucElJCgwwc7GXaz24Muzsufj51ZM4JCDqUOJL577I
         8y0lDFTBusiodKfsYaDkIX2EYJzTGkz49VE9Y/L9VJtQFdnl5ynzKReoRJMys5twIGRP
         nvSY/10TYOwAO3erXaYsCzxIML8wTe8wQmG3Fp/8qOPaeQXWqBKEiToLuh/Xbx7lweEA
         VyVWHS48MwcqugMyHAPTlOz1PtvQ14IX+8enLJHUR+efW0SQY1LadYbNz2hqVPcn2por
         PpPoJOnnmtLruzRQinM7eTOExl3/kIOWrMD0vgY/Iqkf/+TUkxBwzZhX06YMPjgjcPL2
         3S6Q==
X-Gm-Message-State: AOAM53122uPfLw0BA0h6opvyP2rzGx0GXAweeYTaAH4eSFfto8JHyFL6
	MIM+5Zny7QFfnHZ8HPosevOsz2J0JCG/BVHd+zywfw==
X-Google-Smtp-Source: ABdhPJz+tT+vwRLT/un0YR41TNqqDOomNEbU0yM8lSArWPNncnylHvc5h3OSavrgElwizaqHJQOJc6w3u9B9x4FLPeg=
X-Received: by 2002:a2e:8692:0:b0:249:a0b1:3c77 with SMTP id
 l18-20020a2e8692000000b00249a0b13c77mr93511lji.235.1647970265022; Tue, 22 Mar
 2022 10:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220322102115.186179-1-ammarfaizi2@gnuweeb.org>
 <20220322102115.186179-3-ammarfaizi2@gnuweeb.org> <CAKwvOdkEwkzT0uf9a5SokCScDTY4gbhNFZ+fLxsti9innaEZRQ@mail.gmail.com>
 <20220322172550.GL10306@1wt.eu>
In-Reply-To: <20220322172550.GL10306@1wt.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 22 Mar 2022 10:30:53 -0700
Message-ID: <CAKwvOdmr6u-zNynUDAg4pmwerQFUkG+eD0QhpzDED9eg+U2pfA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] tools/nolibc: Remove .global _start from the
 entry point code
To: Willy Tarreau <w@1wt.eu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

(Moving folks to bcc; check the lists if you're interested)

On Tue, Mar 22, 2022 at 10:25 AM Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Nick,
>
> On Tue, Mar 22, 2022 at 10:09:18AM -0700, Nick Desaulniers wrote:
> > Then again, I'm not familiar with nolibc.
>
> No problem. The purpose is clearly *not* to implement a libc, but to have
> something very lightweight that allows to compile trivial programs. A good
> example of this is tools/testing/selftests/rcutorture/bin/mkinitrd.sh. I'm
> personally using a tiny pre-init shell that I always package with my
> kernels and that builds with them [1]. It will never do big things but
> the balance between ease of use and coding effort is pretty good in my
> experience. And I'm also careful not to make it complicated to use nor
> to maintain, pragmatism is important and the effort should remain on the
> program developer if some arbitration is needed.

Neat, I bet that helps generate very small initrd! Got any quick size
measurements?
-- 
Thanks,
~Nick Desaulniers
