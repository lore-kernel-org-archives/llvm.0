Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126984F6465
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 21:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802011; cv=pass; b=ZZOpFiM51ywJOyUL8ehLkSYGChnaBN5ePJKIEPJ+Yj+E+SakYUXK/eGukX7a9VFQd7Kdl2QtbpTul2ECny0v/o/mygAEY5ujnk/AeKOaD9E6jTx6wHEPl9kwm6Kf4RWq+6WqRGMFyRWf3TbJZluuRJKU7oGxDhKn9Dc6bfwfPOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802011; c=relaxed/simple;
	bh=rcs4n9zECvFTiJ4zFF1MuTa8jrtASPjzZuKgErXZ6NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwi5kVN2TEAhyR5rJAoJEA0J3Ts/uyjV3y56XuthsIOQqZf+6JfVSTvqyrLCkA76n5pR3X1FraPlGYGo4BiSNwJ0gT7+Cv2zBFZOIR4gFMe1zEucbaCK89FpzSvys3s/2+jNAtFG6AbiYoT8zeDHnh2fQmek10BtlJTpXuKwTp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIG0dCkB; arc=pass smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIG0dCkB"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48b0514ad8fso202014f8f.0
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 14:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790802008; cv=none;
        d=google.com; s=arc-20260327;
        b=iOGM1pYi2Dlk9iQrRjLci/b+Gy8U4rWRdJKnpJRtfLzuaU3UedQMOsSoqefIObMFvk
         z0Y/l0BA50DYuwmY9RNr/XHBxBXXpqIzwmo4PEY87VrOsytkOxWK6JxHbsDxldAZmC1k
         mWjsMpmJ1BUpRPvI1/EA6pWM1wtID1cSfuYOxd8h/vBVdjFdzDwCa24b4w/s7m/nm3DN
         1MxyzTy1FHycYOEMYv8xrUetTNsnUKbwS/tbOdBAgtdydcJTkU+YPAkwf2rwisVdeO45
         vgfhrlS9/8DMx0PfXm8fG9mq83DLw+OnHKRK7wvxvOeHb/zOsfjM926slE71JDkkQQI6
         +F3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=;
        fh=uOn30/vZ3u2LMErTKM5DhjYpVHAgOUQaRqp9VV5FVn4=;
        b=ShLJkJtGP40ybklmSF+B/8LErGmOAlJzHxXN3fulKLStX2E0/5q1aTIKbseFWLfv1F
         dngBjQTGjjHbqLoCdLEfuWWFtlZ2l4chjhMs8bJ2ddhqsYpi/bk41heX+AKQOlDPanAF
         X9/3k/LwOZRA4p8d/nZj0T/z7mAXhvsgmckjaII24wcZRDaz8qO6JsXUapvf0PhW0a3i
         P61yVrGzAV1DM95otO2jJKbDPkgNQz8fBMD+0jSYPwSxHfEJjBdc4mLP/1lkhz0aW59g
         TyiSiiC5vzqQFOSLlzkeTrL9Y9FVdI3Ykbr0eolkDSTusz77UPPh9S2diURX+FNyYowc
         sf5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790802008; x=1791406808; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=;
        b=WIG0dCkB0M0uIKxk2B3o1FSaDdmwAZC5TzbH+VRi6LbE0YlaiSIe2vbPRqffsrM0Fd
         vxgVCjype5bwdtwR1umj8LutJnijXizsUh4xDXFubLG7XrkLUBIo9GZHAAN+DB1+DcM1
         RiJH+iJVrZx7dme6zdrclwxTdjaduaBQIUgmULeCK3cCqPGo1H6z29IT5MQu1qJyNit9
         xHQI34psvcyPh4670ADzzAqmVsD0h/umc7b63PAs9bYIQlhTHrAT3ue4nDt7YybmzaWR
         929dUnemaWgUu+v46f/EyHX0yRzOJ2BXzZJuNyad1U3euGPZ7HIYJnyYRemVoS4R6FkX
         zeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790802008; x=1791406808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BdHV7DMCXxsggz4//I4AlWe1QoSNzGSaCcBE0kpC5j4=;
        b=bRjPdkezX67DIGeNNUynN5Fj+EedKC3KxBbY10rw22HPGXLUmzXRGGyjUijxnh6325
         udHijiy1NwTVnrhSbJdG32iKALb85USWvKuWJe3ea12RJyw+ZlXp6uKRNk9kxNO0wvgo
         o4jl7PaBNXvc8m933egpr1E2v6n+oWf14UHVsOeYuWrNjJPTZCZPgThGQ15NyjN1l+8z
         +ZrhVaEQyDhXBzS71ZwfGKrAzBaCkesxbRxB1HBtHVi58WtrMklDnrzwiy8s2QUBTY8y
         5onGrZQOOednF9Ud2j9QTzErejBS1i/tjwDjt86g+desGpovLLvI4ldIS9QqJeaYWgBJ
         13oA==
X-Forwarded-Encrypted: i=1; AKwUvBxzxL/ZKiQxJ9DK0vyNZwymusedr8YB0FvHl2qo1p9wiyxUC5f4u+2ui6YyKvt99iNnBUHR@lists.linux.dev
X-Gm-Message-State: AFq9FYJkHxuMHuKkozOTHFJ8eEdA1dTERn4DzObodvB6Agvz99a+Qyhb
	3siwH7mNsMKoZMJJiyKJijh3ToswyCNmQJDO+cWlFzopIsJfOvaaEamQoggTTvr5Hb3XvRkgJjc
	F1EweGLdMm6awI2vJJ+CbRFjh2BrSg2U=
X-Gm-Gg: AYBFou0InmJAcI6bDssulBxoG/L6BJtt0hhKwgf3HdPP0RHe1lBbPxQjF0F6aGqd12V
	NvKaR9cLyxNtzESHHGCdm/wsa86Hu3TmedQpTK8rDyraN3N6F6JN5rqW0dc4lKk3bpxSERWckaz
	eG2Xzu8D9nZU+gzMQNqZSv83YvE5Bp1jWo18HWncKed9ekg381SX2l8D0Avqufw/dKy/S/BwePQ
	IoXKdGekUodLRnKTNoPpPEgOjz80FOkUi2bgzV+13BuuJ8Q2b1PTSu6Vcngt9cNrxfA8LyIA8ZD
	iKpMVph50wZhSjrEVMAvMEMKI6fkFQW7mZ3T3zfFRXyfpiNrJsjKCpX+tMLQ3v5U8TP89Rdwui9
	WqFUWVZa1yekfqnKcWlYh+zDIpGwD7sT8PD0XKZ00hWSZIhFdpSE5yHHZRnXzji8AieZ/tKEIRQ
	YhoA3tvdCrJ14gM3nxaQ==
X-Received: by 2002:a05:6000:2dc6:b0:48b:68:594a with SMTP id
 ffacd0b85a97d-48b024c5716mr5289021f8f.12.1790802008034; Wed, 30 Sep 2026
 14:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat> <fb7ed8ab-8aea-4731-a5e5-c9476d8bfd38@linaro.org>
In-Reply-To: <fb7ed8ab-8aea-4731-a5e5-c9476d8bfd38@linaro.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 30 Sep 2026 22:59:30 +0200
X-Gm-Features: AclHuK-U6pulImpn0m_SQCkcJ5kAgToTplTEZZASDrUoYoF9BUdVXxkuuMMc3Rg
Message-ID: <CAP01T772Vgc4=ShFHQ5bFBAF0PYuQ07xe3h+biT7LST-tahHhg@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Albert Esteve <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	llvm@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 15:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> [...]
> >>>
> >>> Changing the mindset is the hardest part of it. But once you are making
> >>> the shift, it's actually much better to work with. It doesn't mean you
> >>> can go yolo. You still need to be careful in your choices knowing the
> >>> impact on your users. But the API at version 0 is not frozen and you
> >>> don't need to maintain it forever, especially if you control the loader
> >>> and the headers used to compile the BPFs.
> >>
> >> It's really impressive, but there's no way this would become the de-facto
> >> way to program the panels
> >
> > Nobody said it would? And like I said in my previous mail, I actually
> > expect us to keep merging panel drivers. Do I think it should become the
> > go-to solution for simple panels? yes. But we can always make
> > exceptions, and for more complex panels we should totally do a more
> > complex driver. Like HID has been doing.
> >
> >> and if the motivation is to make it simpler this implementation
> >> requires adding bindings and bpf programs which that are the same as
> >> native panel drivers, but won't be able to work until user-space
> >> starts and will require to be in initramfs or rootfs to have
> >> functional display.
> >>
> >> Not sure to understand what are the positive features here except
> >> isolating the panel code in a safe bpf program (is this really needed
> >> ?).
> >
> >  From the cover letter:
> >
> > """
> > Panels in general, and MIPI-DSI panels in particular, are pretty
> > difficult to support and require pretty much a panel driver for each
> > panel produced. Most of them are pretty simple, and require an opaque
> > initialization sequence that is usually poorly documented.
> >
> > This creates a tension between OEMs and distros because OEMs will
> > typically get a new panel to react to a sourcing issue during
> > production, and thus need some swift turnaround between getting their
> > new panel and it being operational in the OS. Distributions on the other
> > hand can take years to ship a kernel with that new panel driver.
> >
> > To solve this, I followed the example of HID-BPF and wrote a panel
> > driver that will rely on BPF programs to perform the panel
> > initialization. That way, we can ship the programs separately from the
> > kernel, and with a different lifecycle.
> > """
> >
> > You can disagree with the solution, that's fair, we can also discuss on
> > how to solve this problem, but I'd appreciate it if you weren't claiming
> > it's all useless.
>
> I did read the cover-letter and I got the arguments from Benjamin, and
> while in theory it could indeed solve the issue described, in reality
> it won't for the reasons I exposed.
>
> And since it's basically allowing to accept out-of-tree downstream
> driver instead of upstreaming, I'm kind against TBH.
>
> But I'm open to discussion, and I'll talk about display Panel in
> XDC today, Plumbers and ELC next week so I hope we'll find time to
> discuss about this in person!
>

Hi Neil, Maxime, Benjamin, and others,

I've been following the patch set over the past couple of days, mostly
out of curiosity. You folks understand the details of your subsystem
best, therefore I trust you with that, but I've seen a lot of
misunderstandings which feed into unjustified worries about how some
of this will work.

For clarity, as several people have already pointed out:
1) BPF programs ship with complete bytecode and line information from
the source, so I don't think the concern about the program being a
binary blob is justified in any sense. The verifier has to verify it
after all, before it gets loaded into the kernel. They also must be
licensed as GPL to have access to any kernel functionality.
2) Adding BPF interfaces does not lock the kernel side ABI into a
perpetual stability contract. There have been several thriving
communities (sched_ext, HID-BPF) which have used BPF successfully in
practice and have never had to make suboptimal technical choices
because they support BPF-based customization. The interfaces have
changed and in some cases completely rewritten without breaking users.
Of course, you might decide to be less or more graceful w.r.t.
backwards compatibility, but this is a choice left in the hands of
subsystem maintainers.
3) On top of all this, there are several mechanisms in BPF programs to
detect availability of APIs and adapt it during load to allow programs
to work across kernel versions, both for functions the program can
call and data it can access.

As far as people being able to carry downstream changes, I think, at
this point, that is already trivial with or without BPF (esp. with
LLMs), the only thing you change is how easy it is for users to avoid
being tied to kernel release cycles.

With the right incentives people will end up sharing their BPF
programs with the rest of the community. sched_ext and HID-BPF are two
strong examples of this. All programs get developed in the open with
community involvement, even when several companies make use of them
internally for their production use cases. The theoretical worries are
fine, but as far as practical evidence goes it has worked out
positively for everyone involved (not once, but twice).

The only valid concern I saw was the dependency on user space to load
these programs. We have had a bpf_preload mechanism in the tree since
forever, it has not found much traction since existing use cases
didn't often need the ability to load programs early. We'd be happy to
explore how it could be adjusted, or reworked to better support
whatever requirements emerge from this work.

In any case, I am not equipped to decide what is best for your
subsystem, but at least from the BPF side, I saw several
misconceptions which I hope the above can address.

Thanks

> Neil
>
> >
> > Maxime
>
>
