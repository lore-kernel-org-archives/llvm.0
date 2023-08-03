Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EB1BA6105
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 03:08:47 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 374596082CF9F;
	Thu,  3 Aug 2023 11:08:35 +0800 (CST)
Message-ID: <414e987b-df9f-53c9-6455-4a2d10f7fcf5@nfschina.com>
Date: Thu, 3 Aug 2023 11:08:34 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fs: lockd: avoid possible wrong NULL parameter
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de,
 kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trond.myklebust@hammerspace.com, anna@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, bfields@fieldses.org,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <0bd584fd-74ac-4b08-ae03-12e329ab186e@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/8/2 18:41, Dan Carpenter wrote:
> There was a big fight about memcpy() in 2010.
>
> https://lwn.net/Articles/416821/
>
> It's sort of related but also sort of different.  My understanding is
> that the glibc memcpy() says that memcpy() always does a dereference so
> it can delete all the NULL checks which come after.  The linux kernel
> uses -fno-delete-null-pointer-checks to turn this behavior off.
Really big fight!
This article seems talk about  problem that using memcpy() to copy 
overlapping regions.
I'm not sure glibc memcpy does the check about NULL， but glibc printf 
does this check.
"And GNU libc checks strings passed to printf for a %s placeholder for 
NULL,
when the C standard says this is not allowed."[1]
[1] https://lwn.net/Articles/416821/
>
> regards,
> dan carpenter
