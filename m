Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C7E173
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 22:10:17 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso5488863wmf.1
        for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 14:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szrglUOKoAQRQL02i1H7q+pkp1ayvzmklTL6wOVwT/s=;
        b=b/pjhf7Ufhd6sE/TL9wGfVLA8ZUgCb4fxEU2pBxi6qcW+J9nNVdu+RuhHHHS5i8zun
         0UzK40qMKlHBZtAEIq9sg4hml/8YIpHn0e8JZDScCaLTNbdSCLGQ2iFy32/ieCbO3Ygy
         846sJwvKK8FsuQcPKxqLm9pu97Hp0MfAr+/xPs78yE9QJvES1YAq6zHnNv9wbcihgrmx
         yyRcyZP2qObq1RATKm9rENCkHWmMySdaL9h9rQQKhlXItbHbwr+Or24AxSo2ulouHhG2
         PZZkeFn/JlxaTyP8JF31uB3fthgI/3V4qWIpBikxYCpnkcbBu7lnEaZaMTkLfTEecZnk
         Lpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szrglUOKoAQRQL02i1H7q+pkp1ayvzmklTL6wOVwT/s=;
        b=6A/WHhT1TT9QfZ2ePYZBMwRB1CHXlcg166IIaWSAhda3HTOEBeS64nRpKcy8luEUeC
         7XuSCA14y6ULZtECpgpMk8vtFtYwHDiNHoJO21qHh2VQ4AaBVggJl79bMKW2dZJvywNj
         G8UfEPgpxglaaibQvZxtxfrHlJH2+Chc4mC/F7Rd8MwCz81GOmqj9c9tglc4LVvUsZ7A
         +/Dab1EBl9v4ad1SN9EsJGGbUX8FPSHcUdJSsR7oJDQn/GNxRbDvuQYAoHaIZbHC4tYm
         7K1bZICOBhrKTVSjpIcB5KWpkNIKY1jdfj5LqXHNICe1qoew2ynjQmXatEN22f58WiH3
         pddA==
X-Gm-Message-State: AOAM5306g3OjtEvyRhDtvSnScaNhH+N8clS6LGx8BfoyNd943IuBm32C
	LfeEDa3Ntd26jZ1G7mDL+/JvylKvlaRbVVsbfmisjQ==
X-Google-Smtp-Source: ABdhPJzGbBUyj7EUYRylWYsQVSn/4u8jYvtro1LgzSOuaaZyieN2jbCY5DvUbQg+W+oh8ulm700AcEz33UFd0c0H6BI=
X-Received: by 2002:a05:6000:1569:: with SMTP id 9mr20621093wrz.500.1642630215593;
 Wed, 19 Jan 2022 14:10:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202201170247.Cir3moOM-lkp@intel.com> <CAJHvVchPpphLefKEOy_C6+0xrGtA3mNCBzQZ3j2i2RgXX3arXQ@mail.gmail.com>
 <CAJuCfpFEfAxtgCfTU=0Ry6g6c-O4OJypGyE-0M+Ce0TKVSAYqA@mail.gmail.com> <CAJHvVciZpSBcQDbqbvwbToo5s2_Q5H2sfr=QAb9UBBWpnD5X-w@mail.gmail.com>
In-Reply-To: <CAJHvVciZpSBcQDbqbvwbToo5s2_Q5H2sfr=QAb9UBBWpnD5X-w@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 19 Jan 2022 14:10:04 -0800
Message-ID: <CAC_TJvc5PwnB5L==4yoXDYeG9g-MKx6Oqb7ghG9gDGqaYEmdYw@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:google/android/kernel/common/android12-5.4
 6517/9999] fs/userfaultfd.c:1519:9: warning: variable 'ioctls_out' set but
 not used
To: Axel Rasmussen <axelrasmussen@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, "GNU/Weeb Mailing List" <gwml@gnuweeb.org>, 
	LKML <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>, 
	Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Lokesh Gidra <lokeshgidra@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 19, 2022 at 2:03 PM Axel Rasmussen <axelrasmussen@google.com> wrote:
>
> On Wed, Jan 19, 2022 at 1:19 PM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Wed, Jan 19, 2022 at 12:39 PM Axel Rasmussen
> > <axelrasmussen@google.com> wrote:
> > >
> > > Lokesh, I only spent a few moments looking, but my suspicion is that
> > > this is the result of an incomplete backport of these patches to the
> > > Android kernel?
> > >
> > > The UFFDIO_CONTINUE patches introduced ioctls_out since the
> > > computation of it got more complicated, and those same patches also
> > > modified the put_user() on line 1533 here to use ioctls_out. I think
> > > Android backported the first part, but left out the second?
> >
> > The backport https://android-review.googlesource.com/c/kernel/common/+/1652718
> > looks like a mixture of
> > 14819305e09fe4 ("userfaultfd: wp: declare _UFFDIO_WRITEPROTECT
> > conditionally") and f619147104c8 ("userfaultfd: add UFFDIO_CONTINUE
> > ioctl").
> > Not sure why it was done this way, maybe to minimize code changes
> > while backporting.
> > Simplest fix is probably to add __maybe_unused to ioctls_out declaration.
>
> Unfortunately, that doesn't quite do it. That would fix the warning,
> but the code in the original e-mail is still wrong: we incorrectly
> don't report the _UFFDIO_CONTINUE bit, unless we use the value we
> computed in ioctls_out.

I think what happened is that Axel's patch [1] depends on the patch
from Peter [2]. [1] was backported without the dependency and the
conflict resolutions aren't quite correct.

[1] https://lore.kernel.org/lkml/20210301222728.176417-5-axelrasmussen@google.com/
[2] https://lore.kernel.org/lkml/20200220163112.11409-18-peterx@redhat.com/

- Kalesh
