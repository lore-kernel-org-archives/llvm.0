Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3881108;
	Mon, 16 Jan 2023 06:14:48 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id p185so1452755oif.2;
        Sun, 15 Jan 2023 22:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHWdhjUdcjn0RozTwaezBeG2P37fhjZ0KDtvnhqWMY0=;
        b=HRUOffaBU/Y/isTX5kyHUhsL0nUexh7rROjOKk3URuKHRCax8OCbnZkaUHGrjg0a83
         tQOmAzXQhkAc7bUZUfNrtxhhZ57YUi4vcFRL27mhdg5abNmva5WDYeA6bqoW7mB8sKty
         Xc5bLRBimHDLeINAeVhy9qHbtt494suCHdlh3rjHliNabN9JT27pb7QjcAza36+Defqi
         DPYPHCaNnfSx3Q9l4aL0ggnhR71i+OBSJkowI/r8+sShkrjUouxsWq6bgPBFPC6RwtuO
         0vRS9OLrtjpa1fJR/qBkG3OPSdmOxxKyxNjBX502TPhBKZcZQFFX8ciirjUfNDP5Kwk2
         WFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHWdhjUdcjn0RozTwaezBeG2P37fhjZ0KDtvnhqWMY0=;
        b=qW9gjmJUSWwIWBpC2d8LmYZ+BwGLiQkS4S87ksLWwdJdIKyrsBIyK7amrrAxNlS7nj
         usxiOcyTu8BI4D1FvklWLNuNFFLCIBmAYqa2Xyg8uVaOREAatvf1LGUnP3mCmOa8mBMi
         WXIUqZ3ZjbjwERNiJgxOQaVY3cBjiP8kplu1oGN2m5pJ8MckpzN/TM6g583XPvHTRqGR
         JSDoTQKGeO+Qh/l6oBwX2Tq06Xopv7Q6/nus/fdmn3fHjLPQh3+lcg4lSVtpcG3YiHzG
         /qVI4LTQF8fa02vKnT+ajZOBhUiWNVK7h4qXlsIJtsEe5IWxoE8dd2SAZTG50aJb+9tY
         ZTpA==
X-Gm-Message-State: AFqh2krVvR6yfAHvpSyjEASCroLLLl1Z3uADtuJi3qTlwAFHqTT4asJc
	zNt8hu/luME/dKQThhp1BP7DQayOfTPvy53g3tE=
X-Google-Smtp-Source: AMrXdXsJXEmviAtZ3+aOJdiEB6ZUOyKYPq4mtIwYbZmC5eHsQMKuRs0UFE7ZiOpN8yL3o5Uhm5z1PMtunxIBIg9qJto=
X-Received: by 2002:a05:6808:289a:b0:364:5d1d:5505 with SMTP id
 eu26-20020a056808289a00b003645d1d5505mr1319890oib.144.1673849686122; Sun, 15
 Jan 2023 22:14:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301150959.RAvfuBjG-lkp@intel.com> <aa73cfb8-99ed-20b4-071c-9858399aee0a@arinc9.com>
 <CAMhs-H_fykbcZjSQ0LKOmtWMLjekDgUHsJjNNqSvYvbY=wbkHQ@mail.gmail.com>
 <Y8QKQ1XKEZvtmJYc@kroah.com> <f250146b-7daf-86c3-f5e6-b98ed497eef7@arinc9.com>
In-Reply-To: <f250146b-7daf-86c3-f5e6-b98ed497eef7@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 16 Jan 2023 07:14:34 +0100
Message-ID: <CAMhs-H-5nh=5jOpbir3THVBk2X5kPQdKRZreU6pZz_rLXZ_uQg@mail.gmail.com>
Subject: Re: [stable:linux-5.15.y 1642/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 9:09 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 15.01.2023 17:14, Greg Kroah-Hartman wrote:
> > On Sun, Jan 15, 2023 at 01:52:58PM +0100, Sergio Paracuellos wrote:
> >> On Sun, Jan 15, 2023 at 10:05 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal=
@arinc9.com> wrote:
> >>>
> >>> Sergio, this issue hasn't seem to gone away. If you haven't sent the
> >>> patch you mentioned here [1], I think Greg taking your upstream commi=
t
> >>> [2] to 5.15.y tree would be the easiest solution.
> >>>
> >>> [1]:
> >>> https://lore.kernel.org/all/CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1=
mO+RxW+J8Q@mail.gmail.com/
> >>> [2]:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/c=
ommit/drivers/staging/mt7621-dts/mt7621.dtsi?id=3Dce835dbd04d7b24f9fd50d9a9=
c59be46304aaa8a
> >>
> >> I forgot I sent [2] at some point :). Yes, taking directly that patch
> >> sounds easier.
> >
> > <formletter>
> >
> > This is not the correct way to submit patches for inclusion in the
> > stable kernel tree.  Please read:
> >      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules=
.html
> > for how to do this properly.
> >
> > </formletter>
>
> Should I do this one if you're busy Sergio? If you'd like to instead, I
> guess you should also add the bot's Reported-by.

That would be helpful. Please do if you can, Ar=C4=B1n=C3=A7. I am a bit bu=
sy
this month. You should also add the kernel test robot Reported-by tag.

Thanks,
    Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
