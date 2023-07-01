Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8BC3C3E
	for <llvm@lists.linux.dev>; Sat,  1 Jul 2023 18:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688234462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FY/9g58dYZvCsDBtU5y7npD5lCzZ2o2xU9z+HF65o04=;
	b=Y8t0r8rw2RvOUPD4dBkmp6Tp7GzHRC1X90fqhVCH2rhFkHr+uqBr9X7U+6z85Z1VNADm9w
	twsh6L4ZwZSOBjGv4gSjbEwDl1TKzLd1XQsTq1xpBGJ92L6XznXrA8pTgtzkJfsR3xEIir
	K7Sh4pDIbs/vOEre3Lg/65JzYYEHxD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-Exw-8LokMTCfXrtSPsv0rg-1; Sat, 01 Jul 2023 14:01:01 -0400
X-MC-Unique: Exw-8LokMTCfXrtSPsv0rg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0BAB858290
	for <llvm@lists.linux.dev>; Sat,  1 Jul 2023 18:01:00 +0000 (UTC)
Received: from [172.64.9.34] (unknown [10.30.34.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D002A492C13;
	Sat,  1 Jul 2023 18:01:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, ad288597)
Date: Sat, 01 Jul 2023 18:01:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <77275.123070114010100274@us-mta-672.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'kbuild-v6.5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94488

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36848=
8


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

