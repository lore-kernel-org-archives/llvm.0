Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C615ECCC
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535741; cv=none; b=eAtqZa1hLyjqqIYqefaLvtP7khn+JSnq0kUCw1kv3VyZmKP6xWSqOVL3jkvOIWTNPaB0+cMtRp5Ku9rjNaCOukYwIv3hFhlG54xWY4YWooGKHmJ4szBXAylU9TLDaxJgyK1SGuCBSvWiOWCf9sszXqVycCV6zs6Az4HNGe7CZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535741; c=relaxed/simple;
	bh=7TMOukyHNRyoQsUeNuRPH3cvWZy5nHihMQz7SNOnEoo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VOKR7UnXQU98S5cDDYKgKy5FrKh9kdJkD81KPSwzKsQw3j31fCSCLvvHJfZ5IHSOkWsmSBw2IAlxtM28jkWnx/b4NuMtNtf4hxJPujkjk+1bA7AkAfsv/t1+WoN6uM3JlemK4GoNX68lqcIM1Ra/atvax8q0z5FtUvjQpT1+48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPaaWOvm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPaaWOvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763535738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n0OXfE/TN2dw48EcKIEgjTXp++nf/wUWah2Y6hRD2Cc=;
	b=BPaaWOvmyu6i/PDPfGi0pYSTpEBfIFRYWT+S1iW+4tQDNwfq6H+mHg/6Mf4JpfPFW0GM81
	ZT63zjjrZRwdcT00Oa/eul+jBs2jpCTCOpnacG3uNBdvn7OJ8ZXM5Ms0bqSKICnf4RGemz
	jqGZdyWbJp1YC8J4lniXJpe6DjEJ8jI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-h5nfvm4QPDe0VSz7x7Kbuw-1; Wed,
 19 Nov 2025 02:02:16 -0500
X-MC-Unique: h5nfvm4QPDe0VSz7x7Kbuw-1
X-Mimecast-MFC-AGG-ID: h5nfvm4QPDe0VSz7x7Kbuw_1763535735
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 717F71800107
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 07:02:15 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F3C2E180049F;
	Wed, 19 Nov 2025 07:02:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.18.0-rc6,
 upstream-mainline, 5bebe8de)
Date: Wed, 19 Nov 2025 07:02:14 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <28560.125111902021600127@us-mta-424.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 06bGXBlldF0P285nwA4KVOc_e5KO1F6d28zsht3jtXw_1763535735
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: mm/huge_memory: Fix initialization of huge zero folio

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2165814475

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: serge-testsuite: infra issue: Unable to clone the testsuite =
repo
            URL: https://datawarehouse.internal.cki-project.org/kcidb/tests=
/937163
            Affected tests:
                selinux-policy: serge-testsuite [aarch64, ppc64le]
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
        Issue: [RHEL10.0] blktests throtl failed
            URL: https://issues.redhat.com/browse/RHEL-66783
            Affected tests:
                Storage - blktests - throtl [s390x]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]



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

