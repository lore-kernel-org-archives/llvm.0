Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF528ED
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664562611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9OrZLvZETi5w5VwU7tmXhfeB1fKMyoru+aZGSoU5V+0=;
	b=aONjdb3PQB4RKWKg49OX0BvyNdMckS1vRc/8wPzSdkfZPnVXyOOtXXKckheloDBwlxuBn7
	2zbN1fYv9vSe5n9L1TwIjWKLODka4H7XBo+kLz6nqwMDi5Dx7nj/4l5/zTfLhaGC/7plOK
	oR+vtB0x76v29boHCAGk5kzPgPg3d38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-7A64G2T8Pi6DMkOKxIkXMA-1; Fri, 30 Sep 2022 14:30:10 -0400
X-MC-Unique: 7A64G2T8Pi6DMkOKxIkXMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2B5C811E67
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 18:30:09 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.34.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C474240C206B;
	Fri, 30 Sep 2022 18:30:09 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0-rc7,
 mainline.kernel.org-clang, 70575e77)
Date: Fri, 30 Sep 2022 18:30:08 -0000
CC: jdoe@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <25230.122093014301000261@us-mta-601.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for_linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/mst/vhost

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/54807

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319412
         aarch64 - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319413
         ppc64le - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319433
         ppc64le - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319434
           s390x - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319419
           s390x - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319420
          x86_64 - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319405
          x86_64 - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319406
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319394
          x86_64 (debug) - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319426
          x86_64 (debug) - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319427



If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

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

