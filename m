Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCEF33D9
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 18:20:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id ek18so32213366edb.6
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679163643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx8RcyjGbjYoysYjRF/7k04CTiu60fPMXIq+lfuhvoc=;
        b=L4xbhGNh21nggR25lxAz4VdcKMsT29/hXjia4Gsn32aIGWdhJt4UVTKgQ/AowYt9JM
         qWp7O9XB4ZyWp5lkxYLrue3ns4sKzm+JL2uGUexmf26v9ZfeOoixMHOBexnwh567HfPD
         /uU72ki/vH89ctGOYHJJg/6dDsbmA9xtpt9qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679163643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx8RcyjGbjYoysYjRF/7k04CTiu60fPMXIq+lfuhvoc=;
        b=Q99lGnKko286gRNawr6rBHlOXPcalKTRosMQF7StKAGw+uTk2+tqMp1R7gLuSr3Vpe
         xwJ/b5yQjijj1INZqrBTtM/8YQPD4VXmWlCCdcV6lHXePqj0CEQlDHSPVXe4tMZGIgkA
         LpaWQyEqeivxGkxaFgG5Wl8WoUAn5gc0HiqKxV4ynRbXkPJ0TfukNMmIh1vsQ3rlgL4q
         /OBXasQjwWGxS6jlElHvGRtVWX+3V7SG33wEFD5A6ZDlxGGeppXkPO0/JYpSo1qNJlvE
         v0V4mSHEzL/lSH1TwNuzkEFoNx5cJhHVsab3T43edT22GDSdaF0+WNSg+8TahEHx44oY
         Jtww==
X-Gm-Message-State: AO0yUKWQaelAqeW03GTvhTKzAP+hAjosOcJ6D9WQ1QtpWq+YByWmMoRe
	YQpXr5JVOcyHvKz2/bq40Wk1Py1YpvwxeIMuQSRY8Q==
X-Google-Smtp-Source: AK7set9m65hE6SH2QGvq2r84DJCDhZbFOkrbfqc7apPWd8Ff2sJOWSt31BQ+X0Ytj/YBkgeChlldJQ==
X-Received: by 2002:a17:906:6a29:b0:887:dea8:b029 with SMTP id qw41-20020a1709066a2900b00887dea8b029mr4914418ejc.1.1679163643562;
        Sat, 18 Mar 2023 11:20:43 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id h18-20020a170906855200b00921357fb28csm2389618ejy.123.2023.03.18.11.20.39
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 11:20:40 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id z21so32251090edb.4
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 11:20:39 -0700 (PDT)
X-Received: by 2002:a50:ce54:0:b0:4fa:794a:c0cc with SMTP id
 k20-20020a50ce54000000b004fa794ac0ccmr3796617edj.2.1679163639042; Sat, 18 Mar
 2023 11:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
 <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
 <CAKwvOdmJkQUe6bhvQXHo0XOncdso0Kk26n8vdJZufm4Ku72tng@mail.gmail.com>
 <6414c470.a70a0220.6b62f.3f02@mx.google.com> <CAHk-=wi5yk0+NeqB34fRC-Zvt+8QZVPTiny9MvCxxjg+ZqDhKg@mail.gmail.com>
 <CANiq72m46OzQPtZbS_VaQGgGknFV-hKvhBw8sVZx9ef=AzupTQ@mail.gmail.com> <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
In-Reply-To: <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Mar 2023 11:20:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiYUWaa676WN5hoyarKeKFDq3nfPg0haRRXeirtHyMg=A@mail.gmail.com>
Message-ID: <CAHk-=wiYUWaa676WN5hoyarKeKFDq3nfPg0haRRXeirtHyMg=A@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"HeungJun, Kim" <riverful.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 1:51=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do think that on the kernel side, the fix is to just change
>
>         } while (type++ !=3D SIZE_DEFAULT_FFMT);
>
> to
>
>         } while (++type !=3D SIZE_DEFAULT_FFMT);

Ok, I ended up deciding to just commit that minimal change, even
though it might have been better to just make it a normal for-loop
(and use M5MOLS_RESTYPE_MAX instead as the end condition).

So maybe it would be more legible (and less likely to have had that
off-by-one) if the loop had been

        for (type =3D 0; type < M5MOLS_RESTYPE_MAX; type++)

instead. But I'll leave that decision to the driver authors (now cc'd).

For people brought in late, this is now commit efbcbb12ee99 ("media:
m5mols: fix off-by-one loop termination error") with link to the
discussion here

    https://lore.kernel.org/linux-block/CAHk-=3DwgTSdKYbmB1JYM5vmHMcD9J9UZr=
0mn7BOYM_LudrP+Xvw@mail.gmail.com/

so you can see the history of it (me having initially blamed UBSAN,
but the problem can be triggered at least in theory without it).

                  Linus
