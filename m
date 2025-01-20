Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F2182BC;
	Mon, 20 Jan 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394766; cv=none; b=Syvg3lm8PWZozxIowunuJn9tWm4O/IxTNdwhVF4VZn+3JXawzmLBB6XTqzS8NSfckZYCYvCiPU3aW7mvMvOla3JHK0zxfi1zSVObsFvSQoa6Fcl19UfsqP/OS3H//oKjOicXx3tpvMFPvIuHCzNsqY4DSBBbpF37cipmcefYziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394766; c=relaxed/simple;
	bh=jB++6IjLQNxR0M117LkNfVzzj7aVcxNKmFbvG4INbeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHvDgUQaWmQl0iKF+im8IUEMsfZDu/kEiJf0c14wdM2MUWWGtEXTEbH9ZTQoEaFtW66OEuRoYJC3v8zasCuRJscxUNODZ0ysRsTr99YQV+qDsDnsGuMHR3860ztXEm5EAjmB0r+VwvBMWPCj+y51XwrWW7WEKifCyRrGsvBZvQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSqvMQtN; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSqvMQtN"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8e8cb8605so25817736d6.0;
        Mon, 20 Jan 2025 09:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737394763; x=1737999563; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jB++6IjLQNxR0M117LkNfVzzj7aVcxNKmFbvG4INbeU=;
        b=SSqvMQtNgPjqbTxYljq2LebHbLax8J633fGkyaO3+04mXu5HERcROLHXNf6KyhXavZ
         0RnRJ8CO8ooc9PFPM7GweFmqdhqiMbHAYxyHAqcENF/EkXriyTrN6VZVMWuSUbCFsP0/
         +f3/dDF+6ZUzTVL2bpo70QhugHVXLmXOb0aiK6PprI/InwOf1eU8n9OufYuY89Pgj8v+
         +ePowsYCXxeY35uu3U9BJ3wPTaK/qAB2thhPyHOI+D2/Qf9OTo+8Fxp01Z1jkjXEeJMq
         +ulWPVfIAcmRXo/aoPluQ8ZmhWsZ813Byvjqu6gCAA5hgeqJAUr1ZCsuZFhKfh9aTKjz
         3MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737394763; x=1737999563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jB++6IjLQNxR0M117LkNfVzzj7aVcxNKmFbvG4INbeU=;
        b=fDZwPr823GNQS1YXCSMvty68ciHSWqFBYTXbqQOl66p/YHrLvYodTjjctVdxiZuDCa
         3BUtBb4HsMU+JeeCpYwtcXZ/HSoAUEJXPi1JFskhHwJ5By6e32cuJHiR8YdQvNVmYDP/
         4GwSTyFIBUgN5PVpeGUtbEoKc+0VGHjOzBcyKSMjLNEURttyjUtVUCrDmfU7jjju4NqR
         6BQqNVO5ouGfF4qlmoDHhEL3Ny5jttFkhZ+fNlxfl50zOI3MUO9roVR9YGfubHIxp2m7
         HpFxtP1WjKXTKQYsIIzLZKiJTSIiuEEWoaTk6MF3c4XqMOTwtP6LQ7QPopTaDRN908ET
         jBHg==
X-Forwarded-Encrypted: i=1; AJvYcCV0iA1a30ax6PZiuvOTh7BesSeXqzRWJZkerzhGDEWtWh4E3yH6xC35gcyd6aKpXJGVvMNbcp7KGOpwIVsbvw==@lists.linux.dev, AJvYcCVBkm7YElDXPuVCgubpQylAzXSz75LB/OG+DZs6fhxeASI9FlcwSV9/f/JytVa5WySwtxQa@lists.linux.dev
X-Gm-Message-State: AOJu0YyytgrkZVvJlBemoHqJN/wL3opZj845D1Po3P6N7vufdbEaBH9g
	h6JypC1Y+2TDw9Lao3Qz0bLZy0d40xUl8inj4HSkOuWYLXI2Fe5Z59L2u77icjSsWk8zZLbIDB+
	EkuhuNch4xWqAPg/sbJRSQ+KbOAk=
X-Gm-Gg: ASbGncvTEkae2p+wpQFSaLl7DpkAOT/hLM5SAi0E3uXufLh9t36htCTti2Xxall7PdD
	7IBi4Zv63yve0Oi5cmAV7YjTuqmMPVD8QqIEQy9SgkHo0oxyRvQ==
X-Google-Smtp-Source: AGHT+IHsqlpc1fdDLyG8TOGH+vxr2N852nqgbrkTUN53MsROV3lFw4+K/tFG0K73unRAvmPCXhS56zqq9ZEBC0yV0Bc=
X-Received: by 2002:a05:6214:2e46:b0:6d8:8874:212a with SMTP id
 6a1803df08f44-6e1b215c658mr211145266d6.17.1737394763576; Mon, 20 Jan 2025
 09:39:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201840.XmpHXpQ4-lkp@intel.com> <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus> <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus> <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
 <20250120172802.GA955657@ax162>
In-Reply-To: <20250120172802.GA955657@ax162>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 18:39:10 +0100
X-Gm-Features: AbW1kvY-teveiFxej_4eNnnHIfTzf6Rrn29skahoDenDg1NMm80T54bBLxLv6tA
Message-ID: <CA+_ehUw2wxDk=bqYoH0XYGVFzbzndCrd2Uz9BUTmEaLH6zUtWw@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 18:28 Nathan Chancellor
<nathan@kernel.org> ha scritto:
>
> On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> > If only these test report were easy to report instead of me having to build
> > the massive llvm-20 dev version...
> >
> > Any hint if anyone knows if precompiled cross tool are present around the web
> > (with llvm-20?)
>
> I see this has been resolved based on my understanding of the rest of
> the comments in this thread but I figured I would comment on this bit.
> You generally do not need a version of LLVM from main (i.e., 20 right
> now) to reproduce these reports, it just happens to be the version that
> the robot used to flag this issue. I maintain precompiled versions of
> stable LLVM releases on kernel.org, which would show this issue with
> that same configuration, no building needed :)
>
> https://mirrors.edge.kernel.org/pub/tools/llvm/
>
> If you try the latest version and the problem does not show up, feel
> free to comment on the report (which should have llvm@lists.linux.dev in
> CC) to let us know and we can see if it is an LLVM main problem (and
> bisect it to get it reported and fixed upstream at that point).
>

Hi Nathan,

I would like to first thank you and anyone involved in this kernel boot test
project. It's a life saviour and helped me a lot to catch all kind of corner
case with randconfig.

My main complain is that a lot of times, the repro step reference clang
version or also gcc version that are actually not present in the download
link making the repro step (and script) not usable.

Now I can use and try the previous version but given some compilation
error happens only on the most recent build tools (due to additional
warning and check introduced) It might be hard to repro.

My honest suggestion to make this even more accessible would be
to also provide beta release of the build tool. Or at least add some
comments in the repro file suggesting also to try with the previous
version.
