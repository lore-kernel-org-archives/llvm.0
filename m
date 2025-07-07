Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4428E59C
	for <llvm@lists.linux.dev>; Mon,  7 Jul 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881945; cv=none; b=d+wJ1DUcySgDxQ6R9IONKYX6qipLrWEBvOuFfZKGF1L3c8vNocdRQGh1BQh2ehkJtOrTI7/6wqeUPrOsssbbK1twzTwV0WFmH0o0KBaxaGsVn45HWRLSBLxVqb8Lx/B4YtEGeZVTToAQic9KcTi6lN3z+Tq84ySxotplTrldJh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881945; c=relaxed/simple;
	bh=xAh8BeaOBaiyL0lSomYl+x1NdPB41sWEegD/RHRfHfs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=nyjpLbn0AQqnFR6hU64IF0ibpp8+RTg8bMeWsVV2l7jJvYdIvWXJeb8SRMG+mo+6I33jdqseg07sF3Vs91E0ffChDqHldVa0AW3QagG5ul3JqB5FQO1bqX12GXZHKFIOtfK4JrPfmbvzpq0XcF3WruSrJK2gadQFB9r2qiK+nEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bufkHE0j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bufkHE0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751881941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NDFXL5mol2wzsBdulo8R1fi5B0LZ8mgrwKAG+UgQ7Ug=;
	b=bufkHE0jGlPq8BHvy4T7GRz3EMltjmOKBlDWrIayOhIkMDuOLy+SCTIYQNHHu5+l8e20Eg
	bPsK0MrSk1Lq0u4/Fv6Om1K0LnJAEPIyq8Nfe0SXuR7s+FwWzCL2AccJeImdY86nxb6ev0
	NeLCudrH9prSHt17f41kPUv/pFzxR/s=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-biF3DsdYPZa3dMzNnXV8iQ-1; Mon,
 07 Jul 2025 05:52:20 -0400
X-MC-Unique: biF3DsdYPZa3dMzNnXV8iQ-1
X-Mimecast-MFC-AGG-ID: biF3DsdYPZa3dMzNnXV8iQ_1751881939
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B4331955ECC
	for <llvm@lists.linux.dev>; Mon,  7 Jul 2025 09:52:19 +0000 (UTC)
Received: from [172.20.236.189] (unknown [10.30.44.207])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB1DC1956087;
	Mon,  7 Jul 2025 09:52:18 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.16.0-rc4,
 upstream-mainline, 772b78c2)
Date: Mon, 07 Jul 2025 09:52:18 -0000
To: liwan@redhat.com, jbastian@redhat.com, omosnace@redhat.com,
 mmalik@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <03250.125070705522000331@us-mta-288.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wepGvvBau09SxojfkT0rlLBqblMIsT2lytYTaW8F25A_1751881939
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'sched_urgent_for_v6.16_rc5' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1909621817

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1909621817-x86_64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1909621817-aarch64-kernel_upt_14
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
        stress: stress-ng - memory
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1909621817-s390x-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1909621817-x86_64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1909621817-aarch64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: selinux-policy: serge-testsuite: [   FAIL   ] :: Install req=
uires (Expected 0, got 1)
            URL: https://datawarehouse.cki-project.org/kcidb/tests/2512899
            Affected tests:
                selinux-policy: serge-testsuite [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]



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

