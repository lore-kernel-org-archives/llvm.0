Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD42F2B
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 15:53:53 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id q204so25967467iod.8
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WXOsmtDny0WluDniF2bqbqtLayhd1SNumBfgvAoXVDc=;
        b=ENABLJMA05R4soziave+d7UPm5zfjbrRymzXBoJsaW0z6qAKD2n9BRtw7tMe8IWvtT
         Dtw076aY5ms2kHZAAIDpNevhFb8kbWcCRn5sIFiTdWfl+S4e2MesYrqCgrU0NJHNQkOc
         frhUCeyRRNVCb6l36CVwAiB4lbVwnXLyCG9nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WXOsmtDny0WluDniF2bqbqtLayhd1SNumBfgvAoXVDc=;
        b=qULt5+SSXaNgGp5UrkzIxB0Uu3VqNcoY2RlHp3vtjwifIzELE8679SL0XGT0e9K5Sb
         LrSiG5qKAWe8PdqN8+IzGfI+a6HNH09YreXKNGxAzyuCOAhpyL4DnH7Gt1X9K5Q06BWo
         PKDbPzUpLCiZM8p8t7UeUZQJbhVVyamwl1cTi60VBrr9uMtK2lIJNbjrEX6yQ4LLkvLO
         ann5+BM48Bs01sQxAP4AJUiVwcyb81Mgumhk9QK1IyK+Eq6AxVbNPpHd6bOFS5PILUWG
         En9FIWjJRp/+MLAO50kiundyyVPjqdeBklDEqOFnwE8mZZkF02KQeVMw7348iQIl2sHD
         EuJA==
X-Gm-Message-State: AOAM531uVLCiPM4Dp4Ip1xNJ4AUN8wB4Du/evuKFi2FXZLYIBP+S/saT
	q4GyMiIj7+QyKRTWTWluvvd5gw==
X-Google-Smtp-Source: ABdhPJw6EtuJMPNRgqXBZ1urjdtS9DTte0fKkn/dXlVvcSumMDMNt2EoK1WwnohoNyDsHDMB2u/rhg==
X-Received: by 2002:a02:9f07:: with SMTP id z7mr12280320jal.87.1643817232526;
        Wed, 02 Feb 2022 07:53:52 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id o4sm17381145iou.42.2022.02.02.07.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 07:53:52 -0800 (PST)
Subject: Re: [PATCH] selftests: fixup build warnings in pidfd / clone3 tests
To: Christian Brauner <brauner@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>
Cc: Christian Brauner <christian@brauner.io>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Zach O'Keefe
 <zokeefe@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20220127221115.3731388-1-axelrasmussen@google.com>
 <20220128085759.qgn7o3w57d6oknzv@wittgenstein>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <54a0cd63-6ec9-21fa-722a-da933b0ff1bf@linuxfoundation.org>
Date: Wed, 2 Feb 2022 08:53:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220128085759.qgn7o3w57d6oknzv@wittgenstein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/28/22 1:57 AM, Christian Brauner wrote:
> On Thu, Jan 27, 2022 at 02:11:15PM -0800, Axel Rasmussen wrote:
>> These are some trivial fixups, which were needed to build the tests with
>> clang and -Werror. The following issues are fixed:
>>
>> - Remove various unused variables.
>> - In child_poll_leader_exit_test, clang isn't smart enough to realize
>>    syscall(SYS_exit, 0) won't return, so it complains we never return
>>    from a non-void function. Add an extra exit(0) to appease it.
>> - In test_pidfd_poll_leader_exit, ret may be branched on despite being
>>    uninitialized, if we have !use_waitpid. Initialize it to zero to get
>>    the right behavior in that case.
>>
>> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
>> ---
> 
> Thanks!
> (Fwiw, all those tests should also be ported to use the TEST_*() harness
> infra. Currently it's an annoying mix.)
> Acked-by: Christian Brauner <brauner@kernel.org>
> 

Yes. Porting would be great. I will take this for now for 5.17-rc4

thanks,
-- Shuah
