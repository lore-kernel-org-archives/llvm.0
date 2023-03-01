Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A018BE1
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677702068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Xtb7JKYBeQyfTcmohpxyWgUqRj0mF2hauuDw9/TLJU=;
	b=PNtyOLon/XYYlo1Gs5Gmy1cUny5z/iXWhq7ZIstzS1FxX9RSQlxYgcUEBBlu4QPAZY+wjG
	uKeYCHsXvMCqQovoJ3+UDhGij9MfkuTDThfcWvogREt2mo3VQv5S+LuN/FTwLOMmmCfJUV
	9SJv8vy0m/roUKc7UMc1p75zsIp2y+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-N_RqWSDAM_GdCPD15em7bA-1; Wed, 01 Mar 2023 15:21:05 -0500
X-MC-Unique: N_RqWSDAM_GdCPD15em7bA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D8DC101A52E
	for <llvm@lists.linux.dev>; Wed,  1 Mar 2023 20:21:03 +0000 (UTC)
Received: from [172.64.14.37] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36CF12026D4B;
	Wed,  1 Mar 2023 20:21:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, ee3f96b1)
Date: Wed, 01 Mar 2023 20:21:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <45597.123030115210500793@us-mta-398.us.mimecast.lan>
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
    Commit message: Merge tag 'nfsd-6.3-1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75202

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31800=
6
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31800=
7
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31800=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/318010
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31800=
9


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

