Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655628F42
	for <llvm@lists.linux.dev>; Fri,  3 Mar 2023 20:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677873663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kc3ywyCF2GS2J9smPU2geQkjQcu+Sy3BW7zDR/LuGuA=;
	b=ESpz4NhSf/T3Qe+h17Y2Qx/N6nCjR0u0PXCimfTb9iMmhDwVlYBLhlgCy+bo6TLNO6ZPPw
	aZc/wmr2nY+CKzM8xQY5MLwLR/OVlmMQ4emnUM5WURIGfafNczC3Frp4yA11qZ4JMLOqn8
	YnMm6+sSCRpTl5mSU4hbAlVDuPW9rNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-lumBMOWiNzuDKJciGi-U2A-1; Fri, 03 Mar 2023 15:01:02 -0500
X-MC-Unique: lumBMOWiNzuDKJciGi-U2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C3D185C70D
	for <llvm@lists.linux.dev>; Fri,  3 Mar 2023 20:01:02 +0000 (UTC)
Received: from [172.64.0.76] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBADF2166B26;
	Fri,  3 Mar 2023 20:01:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 0a3f9a6b)
Date: Fri, 03 Mar 2023 20:01:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <54302.123030315010202006@us-mta-589.us.mimecast.lan>
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
    Commit message: Merge tag 'thermal-6.3-rc1-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75875

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31907=
4
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31907=
5
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31907=
6
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319078
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31907=
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

