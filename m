Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D227E5
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 22:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678573894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZOZt8mxWhE0wtw9xgseZKNCiQcca2KfslY1quZPiuC4=;
	b=BteuYqRihdmb9SlmwmRzzrAMc8TWMxaJODonaJlbEiYjlN48axLkzWXxgOVHH5JzfiIdsE
	3DjuOd+/RFtjo5a2hLM+OrsutMq/AhioZiK0kbZNH6lwNVVn1tY0e+dHJDKe0g+HBRO8tw
	GwXpEL8ervi3mdPwSYR/eqX6n/+1gNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Mt1zNyN8PLeyh6p-EQ_cFQ-1; Sat, 11 Mar 2023 17:31:32 -0500
X-MC-Unique: Mt1zNyN8PLeyh6p-EQ_cFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81ACD38041E2
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 22:31:32 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF02C16028;
	Sat, 11 Mar 2023 22:31:32 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (273/381 SKIPPED): Test report for master
 (6.3.0-rc1, mainline.kernel.org-clang, e25c54d1)
Date: Sat, 11 Mar 2023 22:31:32 -0000
To: llvm@lists.linux.dev, ffan@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <26204.123031117313201609@us-mta-651.us.mimecast.lan>
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
    Commit message: ubi: block: Fix missing blk_mq_end_request

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/77932

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - Storage - swraid simple_reshape
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7402353

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Boot test: Failed to extract kernel version from the package
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1002
            Affected tests:
                 ppc64le - Boot test
                   s390x - Boot test
                  x86_64 - Boot test
                  x86_64 (debug) - Boot test
        Issue: Usex - version 1.9-29: FATAL ERROR: zipinfo returned exit st=
atus: 3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1543
            Affected tests:
                  x86_64 - Usex - version 1.9-29
                  x86_64 (debug) - Usex - version 1.9-29
        Issue: kselftests upstream - net: FAIL: tls.13_sm4_gcm.sendfile
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1479
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream - net: FAIL: Ping received ICMP Packet t=
oo big
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1571
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: [Rawhide] kdump - kexec_boot: [ ERROR ] :: Kexec boot failed=
. Expect to see newkerneloption in kernel boot options
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2057391
            Affected tests:
                  x86_64 - kdump - kexec-file-load
        Issue: kdump - kexec-file-load: Kexec boot failed as fileloadoption=
 is not seen in kernel boot options
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1433
            Affected tests:
                  x86_64 - kdump - kexec-file-load



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

