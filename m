Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4E1FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:26:44 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4KdBpJ6HZ5zMpnmq;
	Tue, 12 Apr 2022 19:01:44 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4KdBpJ1qx0zlhSMv;
	Tue, 12 Apr 2022 19:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1649782904;
	bh=D4tvm9gd+xzUFoj5yn93Kf1fcGNxfhLoNVwUtiNm+N4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=vUPtmY2PWXnsJ4TYj6Y7RdZSDDITDLN6j2/m1GJVMdZ2zsDKceJ4Y1S9myjmEaNGT
	 156NoyTctEQ+cTGCMTEnFFa5UEjTZtUetCtqbVDJrIa9Q0RgxKnzR5x2BFyJmbqTPQ
	 zlM+bWZ3SC32rojpmYekoRt2AsLf274IZ68YvZ4E=
Message-ID: <f5bee21a-6527-d9e2-34a8-a4d930ba85a4@digikod.net>
Date: Tue, 12 Apr 2022 19:02:01 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220412153906.428179-1-mic@digikod.net>
 <c94e68e0-b1e7-4fd8-ce76-5647b8309933@redhat.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [PATCH v1] clang-format: Update and extend the for_each list with
 tools/
In-Reply-To: <c94e68e0-b1e7-4fd8-ce76-5647b8309933@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/04/2022 18:51, Tom Rix wrote:
> 
> On 4/12/22 8:39 AM, Mickaël Salaün wrote:
>> Add tools/ to the shell fragment generating the for_each list and update
>> it.  This is useful to format files in the tools directory (e.g.
>> selftests) with the same coding style as the kernel.
>>
>> Cc: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Mickaël Salaün <mic@digikod.net>
>> Link: https://lore.kernel.org/r/20220412153906.428179-1-mic@digikod.net
>> ---
>>   .clang-format | 177 ++++++++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 149 insertions(+), 28 deletions(-)
>>
>> diff --git a/.clang-format b/.clang-format
>> index fa959436bcfd..70d4e7ec4cf9 100644
>> --- a/.clang-format
>> +++ b/.clang-format
>> @@ -65,36 +65,53 @@ ExperimentalAutoDetectBinPacking: false
>>   #FixNamespaceComments: false # Unknown to clang-format-4.0
>>   # Taken from:
>> -#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' 
>> include/ \
>> +#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' 
>> include/ tools/ \
>>   #   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - 
>> '\1'," \
>>   #   | sort | uniq
>>   ForEachMacros:
>> +  - '__ata_qc_for_each'
>> +  - '__bio_for_each_bvec'
>> +  - '__bio_for_each_segment'
>> +  - '__evlist__for_each_entry'
>> +  - '__evlist__for_each_entry_continue'
>> +  - '__evlist__for_each_entry_from'
>> +  - '__evlist__for_each_entry_reverse'
>> +  - '__evlist__for_each_entry_safe'
>> +  - '__for_each_mem_range'
>> +  - '__for_each_mem_range_rev'
>> +  - '__for_each_thread'
>> +  - '__hlist_for_each_rcu'
>> +  - '__map__for_each_symbol_by_name'
>> +  - '__perf_evlist__for_each_entry'
>> +  - '__perf_evlist__for_each_entry_reverse'
>> +  - '__perf_evlist__for_each_entry_safe'
>> +  - '__rq_for_each_bio'
>> +  - '__shost_for_each_device'
>>     - 'apei_estatus_for_each_section'
>>     - 'ata_for_each_dev'
>>     - 'ata_for_each_link'
>> -  - '__ata_qc_for_each'
> 
> Several macros were removed.
> 
> Is this intentional ?

It is an update for v5.18-rc2 so in includes some other changes. I can 
send a v2 with only the tools/ update if it ease the update.
