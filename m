Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E45D28ED
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664562616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BMv0fp0WrNpGmGJjW4jkZWMBLDVvvIZXaodLnWKhKDg=;
	b=fOUaYTG5Iqy7cgTrCZNUGLDkqALnTTigbQ744rCZMuGgGwa4b5/6yre7o4I/YDABRog3Sb
	OV3D2vHNhTaj/1iQyXj4iqT8WCZeHFsQReZCO7KiyvoU/FNTNl6RG+aUVsAAG3b208NW/q
	oHp9xYJ+ejt+kWBkjx7TX1X2dNRlDYI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-ZU4bFwB0NA6dT4HMPJUN-Q-1; Fri, 30 Sep 2022 14:30:14 -0400
X-MC-Unique: ZU4bFwB0NA6dT4HMPJUN-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E1C5800B30
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 18:30:14 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.34.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12157C15BA4;
	Fri, 30 Sep 2022 18:30:14 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0-rc7,
 mainline.kernel.org-clang, 7bc6e90d)
Date: Fri, 30 Sep 2022 18:30:14 -0000
CC: jdoe@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <25245.122093014301401319@us-mta-61.us.mimecast.lan>
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
    Commit message: Merge tag 'block-6.0-2022-09-29' of git://git.kernel.dk=
/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/54805

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319440
         aarch64 - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319441
         ppc64le - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319447
         ppc64le - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319448
           s390x - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319461
           s390x - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319462
          x86_64 - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319454
          x86_64 - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319455
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319399
          x86_64 (debug) - UPT smoke tests ending with WARN result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319468
          x86_64 (debug) - UPT smoke tests ending with FAIL result
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5319469



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

