Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D3197
	for <llvm@lists.linux.dev>; Sun,  5 Mar 2023 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677976806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FGC0dSQRzqZIQoYFO4DVpxOXXGouDia5ZuAvn49t1s4=;
	b=K7agFerCq0gVOBZz3E3EiKZyshqf9xcB5pZ47UTl1QONqu7bp1lPkfTj3SojQ+DWPJ1XlG
	dKF6FPjUfxLN+p/5L5/HyluUIwZZfI+oa/GSTpOJC2cyTnwUonGlkCcMkIFzi4LMitgJ7R
	lLHrKVrcbJp4wEWhM+ZqxbX5q1Wn/w0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-qP-DyHgVM-6Twqpgymf_Fg-1; Sat, 04 Mar 2023 19:40:05 -0500
X-MC-Unique: qP-DyHgVM-6Twqpgymf_Fg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE66929AA3BF
	for <llvm@lists.linux.dev>; Sun,  5 Mar 2023 00:40:04 +0000 (UTC)
Received: from [172.64.0.76] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D44B2492C3E;
	Sun,  5 Mar 2023 00:40:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, e77d587a)
Date: Sun, 05 Mar 2023 00:40:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <35550.123030419400500127@us-mta-674.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: mm: avoid gcc complaint about pointer casting

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/76123

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31931=
4
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31931=
5
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31931=
6
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319318
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31931=
7


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

