Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24A2CA4
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 00:25:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id l22so46272795lfg.7
        for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 16:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Ip1ZKtR5GO6m52ZXK7S9NcjE/I4UflMlSKHU2EY0O8=;
        b=dqXJ4QTQQDIhdN6byXaCtFnoTWi5R1oFDav4HZftMHjUctlwHNHwShcs97Y+FtBGwJ
         n5tCjcriNvDGbEkWH4ziqRD/Zc14HzwSBOjxDBkVTdEDz9if85L/9VRsRXV08wSfJJUu
         PYChKv9kjO28Ws32i9g0Lf3tiRhxemJtPzgf85g9AxdajodzA03qptTUsqR5ir0QLnyt
         3lwvfMbH2WupPzjc9c1inn9fspkNL6v83PUGUxK3e1RoPDGvZ9Mv+UM7D8e6ISNptTRh
         uebEjfzLBHGygwgNQJwCB/NMH05gDSDd4iRzXHtFSJ0R4HJg2C0+YuRjBmw4lIM+QlDi
         auVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Ip1ZKtR5GO6m52ZXK7S9NcjE/I4UflMlSKHU2EY0O8=;
        b=rouRbVkFo8XeMsqGWZ9ZOHiowlKgA6MKFqvD8/jB680dmftZit6DyL6HJ11EsHZhsL
         SeQAMI9vDhTXEJPWaQ+d8J/XDklm5kNWQX8VMXcOv77lJ7IARwuVLqToNILUEpwW7Uql
         8y0kSnPhiL4OKNRyjT69146zKlu6osJ/MJ2H8XIOf/BQKmiWfyk0jQQA2g7CX9vGG5ry
         7yk1pLgzGfSlg9AZB5RNNfri4kk++6ER14xeUaPQ4/RaXZEYHQyzmEyW0ECv9lw77+tO
         24lPi+BU+2XRQPeIQmFZFuE5zwElEmr2W2sGqrmmhIIPlFkmtIOWgfwn5mZ0689TzB3c
         Vrvg==
X-Gm-Message-State: AOAM532H9OjMaNS4GzJDTLlArLH0miHsE6y+ewBOYbu2vFDXJ3Ko9QI1
	hdhc2ERbzTGiCf1zAjk5fVV+r/aLIVOqgyV0Ugh/0A==
X-Google-Smtp-Source: ABdhPJxAIr24ixXUd9zNYrnv2aQsi9b8j6cGxzMLaqa8JOWaJLeWAscC2myBt3pHtYAz714t6f1FofNi9B+xMzJNE3c=
X-Received: by 2002:a05:6512:607:: with SMTP id b7mr12494298lfe.489.1639614357779;
 Wed, 15 Dec 2021 16:25:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <157245708.33559.1639605989199.JavaMail.zimbra@efficios.com>
 <CAKwvOdkUhqt8eUQ_3HknXkF=6LBFY6Zc7rsXFPCT3GwNfmDoUQ@mail.gmail.com> <CAKwvOdmxOsEFkEGuh86F5CZ9sgqq8G9di9ryVUEeTQCjfoETqA@mail.gmail.com>
In-Reply-To: <CAKwvOdmxOsEFkEGuh86F5CZ9sgqq8G9di9ryVUEeTQCjfoETqA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 15 Dec 2021 16:25:46 -0800
Message-ID: <CAKwvOdndCue_E4eE1_bnGisrPnmUY7vRb_FP_TMs4bQRTOi8Rw@mail.gmail.com>
Subject: Re: clang asm goto issue small reproducer
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, James Y Knight <jyknight@google.com>, 
	Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 4:18 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Dec 15, 2021 at 3:50 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Dec 15, 2021 at 2:06 PM Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> > >
> > > Hi Nick,
> > >
> > > I have a small reproducer for the asm goto issue we discussed over ir=
c. I have
> > > axed away all code that is not the problematic function by hand. Hope=
fully this
> > > won't change the overall optimization context too much.
> >
> > If I cut the compilation pipeline off at after "middle-end"
> > optimizations, I can see that `this_cpu_list_pop` returns `NULL` for
> > test.c while in test-asm.c, it's a phi node of either NULL or head
> > (which looks correct; for the test-asm.c case).
> >
> > "GVNPass" seems to be converting
> >
> > return:                                           ; preds =3D
> > %cleanup.thread19, %cleanup.thread
> >   %retval.118 =3D phi %struct.percpu_list_node* [ %9, %cleanup.thread ]=
,
> > [ null, %cleanup.thread19 ]
> >   ret %struct.percpu_list_node* %retval.118
> >
> > into:
> >
> > return:                                           ; preds =3D
> > %cleanup.thread19, %cleanup.thread
> >   ret %struct.percpu_list_node* null
> >
> > Which drops the
> >   %9 =3D load %struct.percpu_list_node*, %struct.percpu_list_node**
> > %head, align 8, !tbaa !9
>
> Ah, Eli pointed out that I'm chasing the wrong squirrel. From test.c we h=
ave:
>
> struct percpu_list_node *head;
> load =3D (intptr_t *)&head;
> ret =3D rseq_cmpnev_storeoffp_load(targetptr, expectnot,
>      offset, load, cpu);
>
> then in rseq_cmpnev_storeoffp_load():
> __asm__ __volatile__ goto (
>   :
>   :
> [load] "m" (*load));
>
> Did we ever initialize head?  Isn't this equivalent to:
>
> int* foo (void) {
>   int *head;
>   int **load;
>   load =3D &head;
>   asm(""::"m"(*load):"memory");
>   return head;
> }
>
> Isn't that equivalent to:
>
> int* foo (void) {
>   int *head;
>   asm(""::"m"(head):"memory");
>   return head;
> }
>
> For which neither compiler warns for -Wuninitialized? They would if
> head was an argument to a function call...

What's going on here...

$ cat y.c
void x (void) {
  int y;
  asm(""::"r"(y));
}
void z (void) {
  int y;
  asm(""::"m"(y));
}
$ clang -Wuninitialized y.c -c
y.c:3:15: warning: variable 'y' is uninitialized when used here
[-Wuninitialized]
  asm(""::"r"(y));
              ^
y.c:2:8: note: initialize the variable 'y' to silence this warning
  int y;
       ^
        =3D 0
1 warning generated.
$ gcc -Wuninitialized y.c -c
y.c: In function =E2=80=98x=E2=80=99:
y.c:3:3: warning: =E2=80=98y=E2=80=99 is used uninitialized [-Wuninitialize=
d]
    3 |   asm(""::"r"(y));
      |   ^~~

Only 1 warning each? I expected 2.

Is there something special about "m" constraints and -Wuninitialized?

--=20
Thanks,
~Nick Desaulniers
