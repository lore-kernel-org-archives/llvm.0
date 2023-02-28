Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E0363
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677543016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2QpiwWTAHxvmMtJjmGSgQsglqHeC0UVzNZJZ6gq4Btc=;
	b=V+jiKGzBK5hezm20pvzHm997/lwlJm4gqeNk9RhnUFG91NAPTS+qcVuBuqehlVGl+tma9V
	KMPzFjoZq/ch7ZTMnsXnImjIhmt14XersjPTlSKcTVweVkLiIjHp0UHtzhXV4UDXdnw/F/
	zb0k+s1pMydSxtQbXg+IMVRYnlXzR+A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-n2TEpiSnOAqr7GXVexjrOQ-1; Mon, 27 Feb 2023 19:10:15 -0500
X-MC-Unique: n2TEpiSnOAqr7GXVexjrOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48A6B29A9D54
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 00:10:15 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A79AD404BEC5;
	Tue, 28 Feb 2023 00:10:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 32ff6831)
Date: Tue, 28 Feb 2023 00:10:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <60072.123022719101501665@us-mta-481.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: FAILED


Kernel information:
    Commit message: kunit: Fix 'hooks.o' build by recursing into kunit

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74708

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31735=
7
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31735=
8
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31735=
9
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317361
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31736=
0

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7276251



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

