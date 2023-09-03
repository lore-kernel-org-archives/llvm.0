Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E01115
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 05:25:33 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a7e68f4214so375387b6e.1
        for <llvm@lists.linux.dev>; Sat, 02 Sep 2023 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693718732; x=1694323532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+Eh2A53idbaKGC4D48PHUvqh0huBtkkZ1MnEHrGGnU=;
        b=fnImMDwidOo8AZBfSNG3PSZHMH3QyCIlZt7ftIezZwdI3u7ialLZ8Y19tBI+6jrspb
         +sFFHTiSEHL0wLGlhr6HfQkSavKR8+6dXNXyA37Yw4phycLQJgtN4tI5ebVXcxQrZuIC
         cB5VOh5FVYixZZ+vFdNnjLugW8dHD/v2w+dg3VwS7LLSv4UtlJuSaSmCN21v9RPJMRVE
         5gz4MlU1F1YV2bTCflcjB8oUJxI4Hve/PJ22o63D4u2NiC0TSlfnabZUT95y65g6jysh
         QDLn53wEwosvTzEr6GbM3fB0eLmelPOhO2j7jY+6B7ii97jlskPDyKiQ+eHAIxi2uqhm
         5HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693718732; x=1694323532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+Eh2A53idbaKGC4D48PHUvqh0huBtkkZ1MnEHrGGnU=;
        b=U9Mhy16zo8MbB/FNtKFottkS0bNh5NoU6loM3FnUIIfXANclDIFXWoEKqqxui/+kfy
         yiFn2H4XHSdUev2yl9bWZCh/uTXwpUSVUvi4PrFnXcv9Hi4j0jodnJTDXe6VkYfUhEqt
         z+VWJ4B53+6ic5COlXz3GQmI0Ad6EC/7LvO9M1QzzK7aE5z/PJJIlDaQu488EhyQRgRZ
         AG6+fhD5+q3nOBivgjjY6F7htBKeksIS+UReFuMTMwczBaANIz3m9PmJgBRMtP1Qk90Z
         Ey1ih7NVLI0z/cSTZts9AW9eHMQJbL03hgvYNOAZK4URY5CnJqOMoJCOQhn4clAsbpbH
         IS2w==
X-Gm-Message-State: AOJu0Yzb6tECkETiwo6IzjJq9JzwSLXwgy+afmAT+SR9DHmG/31aE+g3
	+szYP8ouAlwdo0WBXA1ohcXEAQ==
X-Google-Smtp-Source: AGHT+IGNq/nmzcBfE8tNNcctP8MOqZWNtdKzxAcW4XkHpsLIVYvoFFHRLzprcuZfIYR0M4JgREsJXw==
X-Received: by 2002:a05:6808:138d:b0:3a7:82e8:8fd1 with SMTP id c13-20020a056808138d00b003a782e88fd1mr8799733oiw.20.1693718732506;
        Sat, 02 Sep 2023 22:25:32 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001bbd1562e75sm5391337plg.55.2023.09.02.22.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 22:25:31 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qcfc0-00A8ep-2J;
	Sun, 03 Sep 2023 15:25:28 +1000
Date: Sun, 3 Sep 2023 15:25:28 +1000
From: Dave Chinner <david@fromorbit.com>
To: syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com,
	viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
Message-ID: <ZPQYyMBFmqrfqafL@dread.disaster.area>
References: <000000000000e6432a06046c96a5@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000e6432a06046c96a5@google.com>

On Sat, Sep 02, 2023 at 09:11:34PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b97d64c72259 Merge tag '6.6-rc-smb3-client-fixes-part1' of..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14136d8fa80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=958c1fdc38118172
> dashboard link: https://syzkaller.appspot.com/bug?extid=e245f0516ee625aaa412
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.

Been happening for months, apparently, yet for some reason it now
thinks a locking hang in __fdget_pos() is an XFS issue?

#syz set subsystems: fs

-- 
Dave Chinner
david@fromorbit.com
