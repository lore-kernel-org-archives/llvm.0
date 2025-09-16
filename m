Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B47BA4A
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050321; cv=none; b=SDM02pl7+ALJpcZju/E5Hgy6c/m6lkFdT3CA8Yp37lnSuHrv46pYwHG7RsnKQksv/Rl4oOa0ARSvR/fV25nSqFkGUVAfi46x0ymws7o6PQ2rLJRRIMsPeoDxSLslz3ZOX35A58EVmcbjJexYh2nqOUXqOceKEoOowjYfYsHNza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050321; c=relaxed/simple;
	bh=1kDmSWrGEXahaVuQIIQN/IiiF8rFQZcXK17wadmNgyY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=q7ziJC97DdyqvWIlpjzqSbneCoGPOF+NJdOq69B+bqLAULi3CnxZWwl6HHsBz7itbfZ9kQRuKHT1U21iUxmHZuTgdEr6A67ipd1dmCObAVD/Uf+TrvZUTseErzn4rBLdN+laiu8DxNSuird1j7LpJNPtHzzXCtI1BzMbWZimelk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvTnybUJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvTnybUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ukzgK1mg47GuMC98MyqsB9SXY9++kjhssZuEwvKYFfU=;
	b=YvTnybUJBqlf8CuOzjJlMKKAkgI+7kvfywLS1qTf6mgrOSjiM3Ls6yL2gL4X3dYsjMUpVu
	bsdo6YiJ5dtgJ00TuLR9xDUXE8neInu2I+YBQI/eURPVhtQN4NARdTTf2oMekRf9ecTvB7
	kMTiJLNlPRSOrFLbrg01lNpPhGF35jk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-PofhC0JBPOSPpqZZyiYFhQ-1; Tue,
 16 Sep 2025 15:18:37 -0400
X-MC-Unique: PofhC0JBPOSPpqZZyiYFhQ-1
X-Mimecast-MFC-AGG-ID: PofhC0JBPOSPpqZZyiYFhQ_1758050316
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51988195608A
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:18:36 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C7AEC19560B8;
	Tue, 16 Sep 2025 19:18:35 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 3 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 35a813e0)
Date: Tue, 16 Sep 2025 19:18:35 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <41541.125091615183700570@us-mta-618.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _DX-l8hhci-1oiV43KkHctfP3KKDuh3SCHbG5Q4jiHE_1758050316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'printk-for-6.17' of git://git.kernel.org/pub=
/scm/linux/kernel/git/printk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1965566148

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1965566148_x86_64_kernel_kcidb_tool_19287530_30
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

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
        Issue: kernel BUG at kernel/cred.c:104
            URL: https://lore.kernel.org/linux-nfs/20250508051829.bdv2r72l2=
o5rsbni@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/command [x86_64]
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]


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

