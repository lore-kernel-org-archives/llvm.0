Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8D168
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 09:39:33 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id 9so7036912iou.2
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 01:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mOWNK48mEIZNTEIU7X2S+zCbDX4zoirQGUmKxIAmRuY=;
        b=dYsqpb0VN19LiiHn0Ftk9MiBf8mLuwmItMaty3MbxyFbZsMAprnM3GLwYQMQizXEde
         OXUdAouUsM70Dc4jnK61YRQjw3xCjt2tyvts4oByrKh8WeBqLuW/0zMEhjo5zJjn/maz
         2gqEuVK9StCfUcp0QWSBnaMkrJpBmIDqrIAvDjqgo33CVzzKz49I07l1H/emAMyU/CFf
         Ep/7ufX3WJdoBL9KGTvqzN7NAg77FAo8WeSLjjf1Vz5sC3mDPUWoNfiiyA/IvyRml2Ki
         w5SXy/DhkQZhKnJ9YCkkBLIM0uXaxiz56Cz/skvyda28JMRfIBuA1dXf0LiBFsmHbTjM
         eckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mOWNK48mEIZNTEIU7X2S+zCbDX4zoirQGUmKxIAmRuY=;
        b=M9FnI/Cui+iXDAMDtAai9Svs6+phm+wfl5UDciYvW3OUXT0274ohut+mxnpodWgoJd
         hn2heXGUhD+Fdurzg69msNGstQ+HEzVaXS86OoEzL3mRSfRCHQNKcGVJA+QgEcTytyjK
         7+eDcnaS/BLw7RDZODzZPDBI39Y8F0X04b3NCxHKWNxI3dcQQJEmFqIOZzCiNrtkvfDQ
         U/LdOTxclTvrHB5K3xF4oegk4+KSzF3ly1F/4d/HBD3W0Vo90rQRYthNb00AQL0xe0eF
         7YIDfbmrbChu9GQ+u9n0BugofaCwKGZW2T2dtySxz4f0AfL/9A/4TxZwxj0SlqJgoDjL
         S4pw==
X-Gm-Message-State: AOAM530q9p5cThHjU3Dwi3iwvpRsO6lVbz9XKvMhY7OKm50T7Ge4hfLF
	LQUE2k3BKLoSWcqkd/E7d+Kj0TrrQUVt5ju3b0I=
X-Google-Smtp-Source: ABdhPJyRd+01JR5slNdfK/hcvj1Z2MmaGnoA6OcUp5mGkvnMhpK2nOyd9h65xhRei/JqMCZ7vgEv9TSAUFET9ewfa1A=
X-Received: by 2002:a05:6638:380f:: with SMTP id i15mr3355679jav.308.1643362772321;
 Fri, 28 Jan 2022 01:39:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220127151945.1244439-1-trix@redhat.com> <953eb015-4b78-f7b-5dc1-6491c6bf27e@linux-m68k.org>
 <CAKwvOdnWHVV+3s8SO=Q8FfZ7hVekRVDL5q+7CwAk_z44xaex8w@mail.gmail.com>
In-Reply-To: <CAKwvOdnWHVV+3s8SO=Q8FfZ7hVekRVDL5q+7CwAk_z44xaex8w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Jan 2022 10:39:21 +0100
Message-ID: <CANiq72mjngfR8-y9B_yHXVXpm5zFOo1dP=nNd-j+Ge8RtoEfTA@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Miguel Ojeda <ojeda@kernel.org>, Tom Rix <trix@redhat.com>, 
	kashyap.desai@broadcom.com, sumit.saxena@broadcom.com, 
	shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, Nathan Chancellor <nathan@kernel.org>, 
	megaraidlinux.pdl@broadcom.com, scsi <linux-scsi@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 11:47 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Miguel (the clang-format maintainer), Joe (checkpatch maintainer)
> These criticisms are worth reviewing.

Indeed, thanks Nick. In my upgrade to clang-format 11 (from the
current clang-format 4), I will check whether some of these improve.

Cheers,
Miguel
