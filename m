Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B7538F
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 17:37:46 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1o98Zz-000BBO-6p; Wed, 06 Jul 2022 19:12:47 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1o98Zy-000DL8-Qu; Wed, 06 Jul 2022 19:12:46 +0200
Subject: Re: [PATCH] bpf/scripts: Generate GCC compatible helpers
To: James Hilliard <james.hilliard1@gmail.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220706140623.2917858-1-james.hilliard1@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <59cf427f-dd37-4784-4bf7-1a655df44dbe@iogearbox.net>
Date: Wed, 6 Jul 2022 19:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220706140623.2917858-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.6/26595/Wed Jul  6 09:53:23 2022)

On 7/6/22 4:06 PM, James Hilliard wrote:
> The current bpf_helper_defs.h helpers are llvm specific and don't work
> correctly with gcc.
> 
> Generate gcc compatible headers based on the format in bpf-helpers.h.
> 
> See:
> https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Please improve the commit description a bit with all the necessary context
around this, and perhaps also provide a small before/after extract around
the bpf-helpers.h. The github.com/gcc-mirror could stay as reference but all
details should be self-explanatory in commit description.

Thanks,
Daniel
