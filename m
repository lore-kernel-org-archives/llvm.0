Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB33612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:15:45 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso87987pjq.1
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bYdkG3sA2KAUrrJYCSYLU4H9KRcohF9dqpdnh/5rnKg=;
        b=mcBuJVl8t3eyRCmOMRoeCOZpPZMo0NWm3++hS7OHGIkoDKCkhK9Lj3vnDgo4CYN9kw
         4sybxy07MVj0Fl/6XbJiQAvt/0uf1ZA9aGWegy/BEKDe/KuOkcKIyWgH5Kca17GndEyv
         tNTs+db4uV8pyPN2f+cd9XENvvZ+XJ/oyKzc2R4HPIi+MgPfyn4TNj4azNelhWe4AX4E
         TAt8Wm80JTkjJHRIjDxUGr9Yu9sFWxUZRt685zfPJmKr5tf08IcdF+W/LQy2bR4rmV2y
         KDOjop4XP7QnrWh6hWEZOZw/Mb6Kg6x1CQibqpnDrmwTJPTDyl52WskH3bLTI8+CtDPo
         GMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bYdkG3sA2KAUrrJYCSYLU4H9KRcohF9dqpdnh/5rnKg=;
        b=jxEUy1uOl6VgFs2syJIZec6hHzW4avObKw82LAp7HSJGWi1tBcVd/GPnne12CqvbNV
         UGbTfbARV1D9kQ35zsR1+keuU7EzhO+JhFjYKyWSbjRwcjFvxpoHHugOeXA/p8AhJlki
         gJIBLFelX1lbf5DB+lTODeZfzpkAzWkKPuPzvqdw6SNhbdqentAoPO08R5Jhm5biyMV0
         QPNiNaBjtjW1a00PUV+9u3xWRRh5zFO7odMuIs9zrYkRBRa0BjUtzo24D5Gvf2G4MQa9
         h41RvV1gY4f+hB94DhhxIuaPJoiXL2TpVz0SZ2Vh9VRF1yiq6bsEdWqX3G5AFKRd43Ir
         mCSw==
X-Gm-Message-State: ACgBeo2GtoFD3tZ643f/ONHqGbsWemoLXLM0deczNMIneLO3SHgmHiJS
	bc6cVogtH9GdeMPMmlW9z5vRhBJR+53D
X-Google-Smtp-Source: AA6agR6Eu2GT9bB4MMbG6b87ZqbZg8KH+Fqf/rJDkQFGjYrNtBR8BdWj5fK8nNFWL4cv9yeMob3N3Q==
X-Received: by 2002:a17:903:18a:b0:16f:8a63:18fe with SMTP id z10-20020a170903018a00b0016f8a6318femr15548430plg.174.1662758144506;
        Fri, 09 Sep 2022 14:15:44 -0700 (PDT)
Received: from bytedance ([74.199.177.246])
        by smtp.gmail.com with ESMTPSA id w63-20020a623042000000b00528a097aeffsm8941pfw.118.2022.09.09.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:15:43 -0700 (PDT)
Date: Fri, 9 Sep 2022 14:15:40 -0700
From: Peilin Ye <yepeilin.cs@gmail.com>
To: sdf@google.com
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, davem@davemloft.net,
	haoluo@google.com, hawk@kernel.org,
	John Fastabend <john.fastabend@gmail.com>, jolsa@kernel.org,
	KP Singh <kpsingh@kernel.org>, kuba@kernel.org,
	lkml <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
	martin.lau@linux.dev, nathan@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Networking <netdev@vger.kernel.org>, Song Liu <song@kernel.org>,
	syzkaller-bugs@googlegroups.com, Tom Rix <trix@redhat.com>,
	Yonghong Song <yhs@fb.com>, Peilin Ye <peilin.ye@bytedance.com>,
	Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [syzbot] WARNING in bpf_verifier_vlog
Message-ID: <20220909211540.GA11304@bytedance>
References: <000000000000e506e905e836d9e7@google.com>
 <YxtrrG8ebrarIqnc@google.com>
 <CAO-hwJJyrhmzWY4fth5miiHd3QXHvs4KPuPRacyNp8xrTxOucA@mail.gmail.com>
 <YxuZ3j0PE0cauK1E@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxuZ3j0PE0cauK1E@google.com>

Hi all,

On Fri, Sep 09, 2022 at 12:54:06PM -0700, sdf@google.com wrote:
> On 09/09, Benjamin Tissoires wrote:
> Yeah, good point. I've run the repro. I think the issue is that
> syzkaller is able to pass btf with a super long random name which
> then hits BPF_VERIFIER_TMP_LOG_SIZE while printing the verifier
> log line. Seems like a non-issue to me, but maybe we need to
> add some extra validation..

In btf_func_proto_check_meta():

	if (t->name_off) {
		btf_verifier_log_type(env, t, "Invalid name");
		return -EINVAL;
	}

In the verifier log, maybe we should just say that BTF_KIND_FUNC_PROTO "must
not have a name" [1], instead of printing out the user-provided
(potentially very long) name and say it's "Invalid" ?

Similarly, for name-too-long errors, should we truncate the name to
KSYM_NAME_LEN bytes (see __btf_name_valid()) in the log ?

[1] commit 2667a2626f4d ("bpf: btf: Add BTF_KIND_FUNC and BTF_KIND_FUNC_PROTO")

Thanks,
Peilin Ye

