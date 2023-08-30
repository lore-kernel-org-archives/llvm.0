Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CCD628
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 18:32:28 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52c1d861c5eso1993a12.1
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693420346; x=1694025146; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxMQOcEOkcHmKjXLkfpsOfMS9dPGXsxJ/oQ49epgR9E=;
        b=p4CqXnPbYgf3+lRQVzfn69DukjdIFzVth8STU0mf0DT5WAUFG21M9FbqbCNBjeOPHn
         +l48Gca9BfuNPiMUOdEP9+eoHiC74KXENH2qbzNpx4b+zjo5iaK9l8Z0xRpnjpu6hjxY
         PxVSfK4yDfEyJ6cukowT5adpZ13kBMIcRmm0QBkwhTsB3t9RX7EyrEY94RskGmiOB1nK
         gFGz+ELx2KYOWwnmp3S2CtfLhGuudcQrOC7e//36udaU/E5+mWM5jTcKDf/UGA7KI9bG
         IZoLxq4lCiGY+ijovTKMQyxCMM1lHwFKLipBAq2DbaIZNIHQXpFKWeHUbX75wO4fwISV
         J/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693420346; x=1694025146;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxMQOcEOkcHmKjXLkfpsOfMS9dPGXsxJ/oQ49epgR9E=;
        b=JB65L+YjZ/nBNr6cy8CU3xeGhg70Q9ME/TTCGo9A0FC7wxDSTA2Qv2Q2BTMVJ94RGA
         VpTQjrk3nxiSGo1bszggkYK41GRsi5inm2b1Ig0Pc6yiDqPYiUe3hfqJVOyIga2DfQ/s
         FlaEfAPcAu4J+ON7LrppyIqpsFFlZpts3e/4Rnkscf25EUbNSeVwIDHMhOIeQA0Xrjhg
         Jot6C0+XsTBfBHWA15BG9Jo8tQgSW4E8P8AcvwQzxz14u/4+oWQ5bFIOfpxppNEKZoa9
         XB/SLx72w1G8sX/D0+wuJ5i1CGy0Pmnw+VBrvqTwdJHQAAWHTYkUVE4qR3hLbj5uPrAd
         1VPg==
X-Gm-Message-State: AOJu0YwIe02Af+UnKjkaTIwYv6lC4l0e+m0RfWRwFgzS2OYfBNHp1K6L
	hYm2N2kaqv4mJM6IICBQtefAIQNI8IyngZRi0OGOU7I9/mgOvcBy5jhl
X-Google-Smtp-Source: AGHT+IHhpzH+y1pd5hLk4f1MQIvMWQdVa2TWcQH4WzBo1OLD8E9MMdH8ccgBkZpaeQ7GhGNPi2VTHoA1V3O49dmX1U8=
X-Received: by 2002:a50:9fa5:0:b0:523:193b:5587 with SMTP id
 c34-20020a509fa5000000b00523193b5587mr18792edf.6.1693420346315; Wed, 30 Aug
 2023 11:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QWu35QcEyCUUy5M-KSai94DyO99myzt2kDyjmeAOaR5Rw@mail.gmail.com>
In-Reply-To: <CAGG=3QWu35QcEyCUUy5M-KSai94DyO99myzt2kDyjmeAOaR5Rw@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 30 Aug 2023 11:32:07 -0700
Message-ID: <CAGG=3QWWMqFkQ5CnPA_PHA8OGdYidOL6qmVkwRwKV4CUKj4MaQ@mail.gmail.com>
Subject: Fwd: [Announcement] Clang-Built Linux Meetup 2023: CFP
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

This year's Clang-Built Linux Meetup takes place at the Omni Richmond
Hotel (https://www.omnihotels.com/hotels/richmond), which is the same
place as the Linux Plumbers conference (https://lpc.events/). It's on
November 11th, which is the Saturday before Plumbers.

This is a time for people interested in Clang-Built Linux to get
together in person and discuss what we're doing. We're planning on
having presentations, hack-a-thons, and discussions about future
directions for CBL.

This is our call for presentations! If you have a paper,
topic-of-discussion, or maybe a presentation you'd like to practice
before giving the same at Plumbers, please let Nick Desaulniers and me
know about it!

  https://clangbuiltlinux.github.io/meetup.html

-bw
