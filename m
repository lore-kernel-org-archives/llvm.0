Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DB3FC7
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 08:05:57 +0000 (UTC)
Received: from [172.31.7.30] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 23F9B80354A98;
	Wed,  5 Jul 2023 17:05:55 +0900 (JST)
Message-ID: <3b6a61b6-1bb7-187b-481b-22d551bb8dc3@lineo.co.jp>
Date: Wed, 5 Jul 2023 17:05:54 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Rust for linux build error due to Clang (bindgen) version
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yuta Hayama <hayama@lineo.co.jp>
References: <327e5e5a-5aec-316f-c4b1-b1dfcbb4c44c@lineo.co.jp>
 <CANiq72kZeLs1oWbUeZtx3CkGQxMa3Qnn3neV_yEfC+T_D-xtww@mail.gmail.com>
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <CANiq72kZeLs1oWbUeZtx3CkGQxMa3Qnn3neV_yEfC+T_D-xtww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thank you for your response!

On 2023/07/05 3:28, Miguel Ojeda wrote:
> On Tue, Jul 4, 2023 at 11:06 AM Yuta Hayama <hayama@lineo.co.jp> wrote:

>> Does this mean we need something like max-tool-version.sh? But that might be
>> a bit silly... If such "error occurs because the tool is too new" is repeated
>> in the future, I feel that it is necessary to check not only the lower limit of
>> the tool version, but also the upper limit.
> 
> `make rustavailable` already warns for "too new" versions for `rustc`
> and `bindgen`.

Yes, I checked this. What I was noticed is that these tools have the same
lower and upper limits for the required version. (so min-tool-version.sh
was sufficient.) Since there is a range between the lower and upper limits
for Clang, I thought that if we are going to do version checking, we need
to extend min-tool-version.sh or something related to it.

> We could add something like that (as error or warning)
> for `libclang` too, but that particular issue goes away with the
> upgrade in place, so (at least for mainline) it is OK.

I understand that at least this issue will be fixed in the near future (v6.6?).
I will wait and see for a while...


Regards,

Yuta Hayama
