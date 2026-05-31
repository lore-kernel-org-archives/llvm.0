Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71E376A02
	for <llvm@lists.linux.dev>; Sun, 31 May 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780224858; cv=none; b=ZjSrdKEA1sEcbF2Ve0FxH6Iv3ZqTolQhMCDRtbfYyCzahnDfRD5O0wSmjwBiaZ9lKjqgQor6/nQ1AWVXBbTNTCyaGBhc5LValTZDZNvmmk4eE8/oZul4Dppd6eCgwgwP7DsbNze8UjoOYJVEpXq7l+eBmMVLS5eili63M1sDYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780224858; c=relaxed/simple;
	bh=o1dgHZkbjuYhohIZ4BEzUOidwToUXJO/7LFD75Wq7z0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tvgZ+lmPPlyM4k4hMQ+eXP40Zl/6NSVir6NgVLReDSFFRhOEvr+fMh38w1EbMGkUabJfFLQ03mS9f7tiqPavo8URkGtpQxoyJXIGTza6g1S+bJLo9GFllOVwWiDRK8A01TXnm1abYh33sItmg0A7oBtm8nxhlnkVc0pKD8Mqcy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WTAycQUl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WTAycQUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780224855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xgZ4ZxGuOq0BiU8QNUycV/3jQTGAjDldMAF/P9z1w0w=;
	b=WTAycQUlQTLn6FstalLpGLKyL4dngS08p3eNsHe3mY7BfNR874VCDkvyrofZSAi98kAvd2
	vo7hirK5e3oWFTF4ea9lgRbYrNxafl+Oxbj3SQOYdPg9UnAeVxFrWaZShWtAiP+YUEoz//
	7wBbHLwVXEYdx1mT1/L6qtBW7veAxd4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-l_BlzXnEMvqQ89cE2by8GA-1; Sun,
 31 May 2026 06:53:07 -0400
X-MC-Unique: l_BlzXnEMvqQ89cE2by8GA-1
X-Mimecast-MFC-AGG-ID: l_BlzXnEMvqQ89cE2by8GA_1780224786
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B57119560AA
	for <llvm@lists.linux.dev>; Sun, 31 May 2026 10:53:06 +0000 (UTC)
Received: from [172.20.36.69] (unknown [10.30.44.214])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2F4B1945110;
	Sun, 31 May 2026 10:53:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc5,
 upstream-mainline, 9d87d0fc)
Date: Sun, 31 May 2026 10:53:05 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <46889.126053106530700549@us-mta-294.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GE6LATDKBGy2flXob1uiY-cKi4a_yiQz9fWB5cQQb3o_1780224786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'liveupdate-fixes-2026-05-30' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/liveupdate/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2564517828

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2564517828_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2564517828_aarch64_kernel_kcidb_tool_21379637_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/004
                       =E2=9D=8C FAIL generic/005
                       =E2=9D=8C FAIL generic/006
                       =E2=9D=8C FAIL generic/007
                       =E2=9D=8C FAIL generic/008
                       =E2=9D=8C FAIL generic/012
                       =E2=9D=8C FAIL generic/014
                       =E2=9D=8C FAIL generic/016
                       =E2=9D=8C FAIL generic/021
                       =E2=9D=8C FAIL generic/022
                       =E2=9D=8C FAIL generic/023
                       =E2=9D=8C FAIL generic/024
                       =E2=9D=8C FAIL generic/025
                       =E2=9D=8C FAIL generic/026
                       =E2=9D=8C FAIL generic/028
                       =E2=9D=8C FAIL generic/030
                       =E2=9D=8C FAIL generic/031
                       =E2=9D=8C FAIL generic/037
                       =E2=9D=8C FAIL generic/052
                       =E2=9D=8C FAIL generic/058
                       =E2=9D=8C FAIL generic/060
                       =E2=9D=8C FAIL generic/061
                       =E2=9D=8C FAIL generic/063
                       =E2=9D=8C FAIL generic/064
                       =E2=9D=8C FAIL generic/069
                       =E2=9D=8C FAIL generic/078
                       =E2=9D=8C FAIL generic/086
                       =E2=9D=8C FAIL generic/096
                       =E2=9D=8C FAIL generic/097
                       =E2=9D=8C FAIL generic/098
                       =E2=9D=8C FAIL generic/103
                       =E2=9D=8C FAIL generic/105
                       =E2=9D=8C FAIL generic/110
                       =E2=9D=8C FAIL generic/111
                       =E2=9D=8C FAIL generic/114
                       =E2=9D=8C FAIL generic/115
                       =E2=9D=8C FAIL generic/116
                       =E2=9D=8C FAIL generic/123
                       =E2=9D=8C FAIL generic/134
                       =E2=9D=8C FAIL generic/138
                       =E2=9D=8C FAIL generic/140
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/142
                       =E2=9D=8C FAIL generic/143
                       =E2=9D=8C FAIL generic/144
                       =E2=9D=8C FAIL generic/145
                       =E2=9D=8C FAIL generic/146
                       =E2=9D=8C FAIL generic/147
                       =E2=9D=8C FAIL generic/148
                       =E2=9D=8C FAIL generic/149
                       =E2=9D=8C FAIL generic/150
                       =E2=9D=8C FAIL generic/151
                       =E2=9D=8C FAIL generic/152
                       =E2=9D=8C FAIL generic/153
                       =E2=9D=8C FAIL generic/154
                       =E2=9D=8C FAIL generic/155
                       =E2=9D=8C FAIL generic/156
                       =E2=9D=8C FAIL generic/157
                       =E2=9D=8C FAIL generic/159
                       =E2=9D=8C FAIL generic/160
                       =E2=9D=8C FAIL generic/161
                       =E2=9D=8C FAIL generic/171
                       =E2=9D=8C FAIL generic/172
                       =E2=9D=8C FAIL generic/173
                       =E2=9D=8C FAIL generic/174
                       =E2=9D=8C FAIL generic/178
                       =E2=9D=8C FAIL generic/179
                       =E2=9D=8C FAIL generic/180
                       =E2=9D=8C FAIL generic/181
                       =E2=9D=8C FAIL generic/183
                       =E2=9D=8C FAIL generic/185
                       =E2=9D=8C FAIL generic/188
                       =E2=9D=8C FAIL generic/189
                       =E2=9D=8C FAIL generic/190
                       =E2=9D=8C FAIL generic/191
                       =E2=9D=8C FAIL generic/194
                       =E2=9D=8C FAIL generic/195
                       =E2=9D=8C FAIL generic/196
                       =E2=9D=8C FAIL generic/197
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/199
                       =E2=9D=8C FAIL generic/200
                       =E2=9D=8C FAIL generic/201
                       =E2=9D=8C FAIL generic/202
                       =E2=9D=8C FAIL generic/203
                       =E2=9D=8C FAIL generic/205
                       =E2=9D=8C FAIL generic/206
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/216
                       =E2=9D=8C FAIL generic/217
                       =E2=9D=8C FAIL generic/220
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/222
                       =E2=9D=8C FAIL generic/227
                       =E2=9D=8C FAIL generic/238
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/253
                       =E2=9D=8C FAIL generic/259
                       =E2=9D=8C FAIL generic/261
                       =E2=9D=8C FAIL generic/262
                       =E2=9D=8C FAIL generic/264
                       =E2=9D=8C FAIL generic/277
                       =E2=9D=8C FAIL generic/287
                       =E2=9D=8C FAIL generic/289
                       =E2=9D=8C FAIL generic/290
                       =E2=9D=8C FAIL generic/291
                       =E2=9D=8C FAIL generic/292
                       =E2=9D=8C FAIL generic/293
                       =E2=9D=8C FAIL generic/295
                       =E2=9D=8C FAIL generic/296
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/302
                       =E2=9D=8C FAIL generic/303
                       =E2=9D=8C FAIL generic/304
                       =E2=9D=8C FAIL generic/305
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/312
                       =E2=9D=8C FAIL generic/326
                       =E2=9D=8C FAIL generic/327
                       =E2=9D=8C FAIL generic/328
                       =E2=9D=8C FAIL generic/330
                       =E2=9D=8C FAIL generic/332
                       =E2=9D=8C FAIL generic/337
                       =E2=9D=8C FAIL generic/353
                       =E2=9D=8C FAIL generic/358
                       =E2=9D=8C FAIL generic/359
                       =E2=9D=8C FAIL generic/362
                       =E2=9D=8C FAIL generic/372
                       =E2=9D=8C FAIL generic/379
                       =E2=9D=8C FAIL generic/380
                       =E2=9D=8C FAIL generic/389
                       =E2=9D=8C FAIL generic/391
                       =E2=9D=8C FAIL generic/393
                       =E2=9D=8C FAIL generic/395
                       =E2=9D=8C FAIL generic/396
                       =E2=9D=8C FAIL generic/397
                       =E2=9D=8C FAIL generic/398
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/408
                       =E2=9D=8C FAIL generic/412
                       =E2=9D=8C FAIL generic/414
                       =E2=9D=8C FAIL generic/419
                       =E2=9D=8C FAIL generic/421
                       =E2=9D=8C FAIL generic/424
                       =E2=9D=8C FAIL generic/432
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/439
                       =E2=9D=8C FAIL generic/440
                       =E2=9D=8C FAIL generic/443
                       =E2=9D=8C FAIL generic/462
                       =E2=9D=8C FAIL generic/463
                       =E2=9D=8C FAIL generic/470
                       =E2=9D=8C FAIL generic/474
                       =E2=9D=8C FAIL generic/488
                       =E2=9D=8C FAIL generic/492
                       =E2=9D=8C FAIL generic/493
                       =E2=9D=8C FAIL generic/496
                       =E2=9D=8C FAIL generic/497
                       =E2=9D=8C FAIL generic/499
                       =E2=9D=8C FAIL generic/503
                       =E2=9D=8C FAIL generic/505
                       =E2=9D=8C FAIL generic/506
                       =E2=9D=8C FAIL generic/507
                       =E2=9D=8C FAIL generic/508
                       =E2=9D=8C FAIL generic/511
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2564517828_x86_64_kernel_kcidb_tool_21379631_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/004
                       =E2=9D=8C FAIL generic/005
                       =E2=9D=8C FAIL generic/006
                       =E2=9D=8C FAIL generic/007
                       =E2=9D=8C FAIL generic/008
                       =E2=9D=8C FAIL generic/012
                       =E2=9D=8C FAIL generic/014
                       =E2=9D=8C FAIL generic/016
                       =E2=9D=8C FAIL generic/021
                       =E2=9D=8C FAIL generic/022
                       =E2=9D=8C FAIL generic/023
                       =E2=9D=8C FAIL generic/024
                       =E2=9D=8C FAIL generic/025
                       =E2=9D=8C FAIL generic/026
                       =E2=9D=8C FAIL generic/028
                       =E2=9D=8C FAIL generic/030
                       =E2=9D=8C FAIL generic/031
                       =E2=9D=8C FAIL generic/037
                       =E2=9D=8C FAIL generic/052
                       =E2=9D=8C FAIL generic/058
                       =E2=9D=8C FAIL generic/060
                       =E2=9D=8C FAIL generic/061
                       =E2=9D=8C FAIL generic/063
                       =E2=9D=8C FAIL generic/064
                       =E2=9D=8C FAIL generic/069
                       =E2=9D=8C FAIL generic/078
                       =E2=9D=8C FAIL generic/086
                       =E2=9D=8C FAIL generic/096
                       =E2=9D=8C FAIL generic/097
                       =E2=9D=8C FAIL generic/098
                       =E2=9D=8C FAIL generic/103
                       =E2=9D=8C FAIL generic/105
                       =E2=9D=8C FAIL generic/110
                       =E2=9D=8C FAIL generic/111
                       =E2=9D=8C FAIL generic/114
                       =E2=9D=8C FAIL generic/115
                       =E2=9D=8C FAIL generic/116
                       =E2=9D=8C FAIL generic/123
                       =E2=9D=8C FAIL generic/134
                       =E2=9D=8C FAIL generic/138
                       =E2=9D=8C FAIL generic/140
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/142
                       =E2=9D=8C FAIL generic/143
                       =E2=9D=8C FAIL generic/144
                       =E2=9D=8C FAIL generic/145
                       =E2=9D=8C FAIL generic/146
                       =E2=9D=8C FAIL generic/147
                       =E2=9D=8C FAIL generic/148
                       =E2=9D=8C FAIL generic/149
                       =E2=9D=8C FAIL generic/150
                       =E2=9D=8C FAIL generic/151
                       =E2=9D=8C FAIL generic/152
                       =E2=9D=8C FAIL generic/153
                       =E2=9D=8C FAIL generic/154
                       =E2=9D=8C FAIL generic/155
                       =E2=9D=8C FAIL generic/156
                       =E2=9D=8C FAIL generic/157
                       =E2=9D=8C FAIL generic/159
                       =E2=9D=8C FAIL generic/160
                       =E2=9D=8C FAIL generic/161
                       =E2=9D=8C FAIL generic/171
                       =E2=9D=8C FAIL generic/172
                       =E2=9D=8C FAIL generic/173
                       =E2=9D=8C FAIL generic/174
                       =E2=9D=8C FAIL generic/178
                       =E2=9D=8C FAIL generic/179
                       =E2=9D=8C FAIL generic/180
                       =E2=9D=8C FAIL generic/181
                       =E2=9D=8C FAIL generic/183
                       =E2=9D=8C FAIL generic/185
                       =E2=9D=8C FAIL generic/188
                       =E2=9D=8C FAIL generic/189
                       =E2=9D=8C FAIL generic/190
                       =E2=9D=8C FAIL generic/191
                       =E2=9D=8C FAIL generic/194
                       =E2=9D=8C FAIL generic/195
                       =E2=9D=8C FAIL generic/196
                       =E2=9D=8C FAIL generic/197
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/199
                       =E2=9D=8C FAIL generic/200
                       =E2=9D=8C FAIL generic/201
                       =E2=9D=8C FAIL generic/202
                       =E2=9D=8C FAIL generic/203
                       =E2=9D=8C FAIL generic/205
                       =E2=9D=8C FAIL generic/206
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/216
                       =E2=9D=8C FAIL generic/217
                       =E2=9D=8C FAIL generic/220
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/222
                       =E2=9D=8C FAIL generic/227
                       =E2=9D=8C FAIL generic/238
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/253
                       =E2=9D=8C FAIL generic/259
                       =E2=9D=8C FAIL generic/261
                       =E2=9D=8C FAIL generic/262
                       =E2=9D=8C FAIL generic/264
                       =E2=9D=8C FAIL generic/277
                       =E2=9D=8C FAIL generic/287
                       =E2=9D=8C FAIL generic/289
                       =E2=9D=8C FAIL generic/290
                       =E2=9D=8C FAIL generic/291
                       =E2=9D=8C FAIL generic/292
                       =E2=9D=8C FAIL generic/293
                       =E2=9D=8C FAIL generic/295
                       =E2=9D=8C FAIL generic/296
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/302
                       =E2=9D=8C FAIL generic/303
                       =E2=9D=8C FAIL generic/304
                       =E2=9D=8C FAIL generic/305
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/312
                       =E2=9D=8C FAIL generic/326
                       =E2=9D=8C FAIL generic/327
                       =E2=9D=8C FAIL generic/328
                       =E2=9D=8C FAIL generic/330
                       =E2=9D=8C FAIL generic/332
                       =E2=9D=8C FAIL generic/337
                       =E2=9D=8C FAIL generic/353
                       =E2=9D=8C FAIL generic/358
                       =E2=9D=8C FAIL generic/359
                       =E2=9D=8C FAIL generic/362
                       =E2=9D=8C FAIL generic/372
                       =E2=9D=8C FAIL generic/379
                       =E2=9D=8C FAIL generic/380
                       =E2=9D=8C FAIL generic/389
                       =E2=9D=8C FAIL generic/391
                       =E2=9D=8C FAIL generic/393
                       =E2=9D=8C FAIL generic/395
                       =E2=9D=8C FAIL generic/396
                       =E2=9D=8C FAIL generic/397
                       =E2=9D=8C FAIL generic/398
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/408
                       =E2=9D=8C FAIL generic/412
                       =E2=9D=8C FAIL generic/414
                       =E2=9D=8C FAIL generic/419
                       =E2=9D=8C FAIL generic/421
                       =E2=9D=8C FAIL generic/424
                       =E2=9D=8C FAIL generic/432
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/439
                       =E2=9D=8C FAIL generic/440
                       =E2=9D=8C FAIL generic/443
                       =E2=9D=8C FAIL generic/462
                       =E2=9D=8C FAIL generic/463
                       =E2=9D=8C FAIL generic/470
                       =E2=9D=8C FAIL generic/474
                       =E2=9D=8C FAIL generic/488
                       =E2=9D=8C FAIL generic/492
                       =E2=9D=8C FAIL generic/493
                       =E2=9D=8C FAIL generic/496
                       =E2=9D=8C FAIL generic/497
                       =E2=9D=8C FAIL generic/499
                       =E2=9D=8C FAIL generic/503
                       =E2=9D=8C FAIL generic/505
                       =E2=9D=8C FAIL generic/506
                       =E2=9D=8C FAIL generic/507
                       =E2=9D=8C FAIL generic/508
                       =E2=9D=8C FAIL generic/511

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

