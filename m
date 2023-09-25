Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001A10787;
	Mon, 25 Sep 2023 08:16:25 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:fcef:69b2:fccd:bd45] (unknown [IPv6:2001:861:4a40:8620:fcef:69b2:fccd:bd45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AB6966072FA;
	Mon, 25 Sep 2023 09:16:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695629783;
	bh=amPKdjtMA8QAOFF9EQ8eyDnbvaTauDnWFNA/dhbWnBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TINknH8mVjWGtQGi0pB4YGGGgI5ZwhI4Z2GvafLl/3UwNRqjMo1ypx3Hs6xZbYbJE
	 2TTu0E/EP73N3rgguY9/XTXkXIja9xgQ9q7J6iFTteDZbQVfhzNLjNTzNy1Zh95oJu
	 yfkQXa7+Pc0WYuBx/jsDCVYA/SIPkuNnjijaCSEmayxnR99UetPsPQu+Z0/BhC5YAf
	 0voi/rrXrmo47GVuceUFMkrg9PWOkqixDARmJRP0NgnOryUf5qSrHsXXj0doGG95RA
	 KZtrMEmHbXgKEILDGKhc92NxAY3BCIedR1mqCdQeAK5tadXiTBfgBcPyGOauK+aW2A
	 cjFJ3/eadoP0Q==
Message-ID: <e6e5f76b-9303-82a6-f414-5753d80a0ad2@collabora.com>
Date: Mon, 25 Sep 2023 10:17:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Please add new Android branches
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Viktor Martensson <vmartensson@google.com>,
 Betty Zhou <bettyzhou@google.com>, kernelci@lists.linux.dev,
 clang-built-linux <llvm@lists.linux.dev>, Todd Kjos <tkjos@google.com>
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com>
 <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com>
 <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <CAKwvOdmni7Vqo0W1qgGkVx8GH4+D7JXO5QTQgqGv8D=Go4oPAA@mail.gmail.com>
 <CAHRSSEz=S_c=KmgDNL_FenUJ25jLmwKe-QXo7-_nUC-7avD0Gg@mail.gmail.com>
 <CAKwvOdkHE7rXgOUyUSCKZ690bjV88E9yVfmG-7vLH6iqqr2G-Q@mail.gmail.com>
 <CAHRSSEzD=nMKjnmJxsGuPdMy2iqc-jxcppna_eKOb8PH0SQOXA@mail.gmail.com>
 <CAKwvOdk5qut5-EX9N2eJQ7KiaUNFv4CBo_Hh2BJOD+bnupKvQA@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAKwvOdk5qut5-EX9N2eJQ7KiaUNFv4CBo_Hh2BJOD+bnupKvQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2023 18:57, Nick Desaulniers wrote:
> On Tue, Sep 19, 2023 at 5:12 PM Todd Kjos <tkjos@google.com> wrote:
>>
>> On Tue, Sep 19, 2023 at 4:19 PM Nick Desaulniers
>> <ndesaulniers@google.com> wrote:
>>>
>>> Half of the red exclamation marks on that link are are "0 warnings - 0
>>> errors".  What's up with that?
>>
>> This more recent build has "0 warnings - 0 errors":
>> https://linux.kernelci.org/build/android/branch/android15-6.1/kernel/ASB-2023-07-05_14-6.1-2620-gf2d0380464d3/
>>
>> Here is the error (not sure why it bubbled up as 0/0):
>>
>>   AR      drivers/base/power/built-in.a
>> ../fs/namei.c:2172:13: error: use of bitwise '|' with boolean operands
>> [-Werror,-Wbitwise-instead-of-logical]
>>         } while (!(has_zero(a, &adata, &constants) | has_zero(b,
>> &bdata, &constants)));
>>
>> ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>                                                    ||
>> ../fs/namei.c:2172:13: note: cast one or both operands to int to
>> silence this warning
>>   CC      drivers/base/firmware_loader/builtin/main.o
>> 1 error generated.
>> make[3]: *** [../scripts/Makefile.build:250: fs/namei.o] Error 1
>> make[3]: *** Waiting for unfinished jobs....
>> make[2]: *** [../scripts/Makefile.build:500: fs] Error 2
> 
> Guillaume,
> Any idea what's up with that? Seems like the existence of diagnostics
> is detected correctly; the number of warnings and errors is not.

Yes I think there's some heuristics in the legacy log parsing
tool to count the number of compiler warnings and errors.  This
probably is outdated with Clang now, so the build exit status is
used to detect a failure but then the stats are off.

It's better to avoid fixing this code as it's going to be retired
in a few months' time to be replaced with a fresh implementation
based on the new API.  I believe some tweaks could be done to fix
critical issues, but if the detail of warnings and errors can be
found even though the stats are off then maybe we can save the
effort of fixing it?

Cheers,
Guillaume

