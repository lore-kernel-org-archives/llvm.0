Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC898F4A
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769323996; cv=none; b=Dym6XuHz5c8NCpTRF2OXMIRF0Bel29n007VVZBTG4UwOxGlOBw5LKKBCz50sfU7RZc5iouLqBpN5Tu2IA0edO7B2u0siVuUTIq/L9qizhsvgLlsr6/4NORl9gYXivhtaxDrSqH95s+59htcFhNfIJTn+QFKHLxLuJemeBGf9zmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769323996; c=relaxed/simple;
	bh=m+cCdQZGgcIzIMHjAR/n0ksacVTt9yvgxi+sgY70+1o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OJsBxhWV3mLKQDZdOdEV1+UHhG72C+nsuX6L0CFkDp9OXYIWxcsjDWSCTMyINB7V45StOlTRWc7W/Eb6ussua7euoXcnu9gyX9/cN/MDBEv0bsGevTDXiz97N6lKOkRWa6DquFMD/+hwn94eFn2xxPqVIvKOsVB+ghZtnPJlb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DPC5L5T1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPC5L5T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769323994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=59MXtD92PZ5okpV8BaiTERe3FLVyHNBQHJzIYqKjdaQ=;
	b=DPC5L5T12ovOKglNhFVRDZD6yywIVpLIpQqNc+bvWC/SGkoaCmRG9zs215V2F7yhm0tVtH
	eIrX+ycEqZc0KFRvi6irL79ZSMVLC/hs4tTPWFvbG7MQxQIUu4jrAZu/fFlOepRMEsrbCM
	cvwkoqEBV7tloB9dGPvZbxNtLRvlWyI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-c88V1ewfNAOdCiBOAX0MbQ-1; Sun,
 25 Jan 2026 01:53:12 -0500
X-MC-Unique: c88V1ewfNAOdCiBOAX0MbQ-1
X-Mimecast-MFC-AGG-ID: c88V1ewfNAOdCiBOAX0MbQ_1769323991
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3602718005B2
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 06:53:11 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96C421800240;
	Sun, 25 Jan 2026 06:53:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.19.0-rc6,
 upstream-mainline, 5dbeeb26)
Date: Sun, 25 Jan 2026 06:53:10 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <58489.126012501531200113@us-mta-349.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OdqNeiM4gQone1EWYTNLQXYummO92kNB5VPQA62r0eI_1769323991
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'driver-core-6.19-rc7' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/driver-core/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2284402812

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2284402812_x86_64_kernel_kcidb_tool_20518813_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2284402812_x86_64_kernel-debug_kcidb_tool_20518818_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]



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

