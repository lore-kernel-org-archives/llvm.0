Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F15846F
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757656939; cv=none; b=No7IV7OxVBQ0sAgtqXPM/mGTEoTvzJGs6WlBhCS+yL1CP1jb0oYBTj8w8HE7R08je+HPusLZydCdDlRq8hT3fppIY64caRIRlFhCZJ8xmpkpl02Hia897GErUDatH8UtxNRwt9SanGeNJavXk4P5IDPrcgIuE7bzuPiBEs/o04A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757656939; c=relaxed/simple;
	bh=uGlZvhlpp3tPml9ujD8dr5xmPxsTzfnzx8WsMMMPogk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c/FTZbzWSQnXO+amiWrSqT++erxaiXnE7srUvbsz/OZnwVXEk8yS3I6Zn+sOvR0tcrbnPBnbrNXck86C9TEWgcHXYvifidD10HMPz3FIC9b8PFennQpEom6+iJEZymjzgztS4F3UZ4A1zo4ElPIPL0BDmSSqJZGRMUyOfXmyZUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJqdJ52M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJqdJ52M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757656935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=378FMBY4X2+FfP8BKeeFW7hKYa5IutW0dEyt5+hSalg=;
	b=UJqdJ52MtyjXyPZFH26Q59zTwkO4KeKyyvLMLIvBgctrgXSynCcTd+87rXA7fIC8Yk9c82
	BE6w8E47RY106w5/UrIZSFuPlS727zkL/juIc7blSevkY45+0ZSGSG08hZRhQ1NJkvI6I0
	c8bjqDVEpT8iS+ActSqTVhEx0U72nOI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-cOF9Qiy-OGiw3fyl9D3PXQ-1; Fri,
 12 Sep 2025 02:02:14 -0400
X-MC-Unique: cOF9Qiy-OGiw3fyl9D3PXQ-1
X-Mimecast-MFC-AGG-ID: cOF9Qiy-OGiw3fyl9D3PXQ_1757656933
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E6161800576
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 06:02:13 +0000 (UTC)
Received: from [172.20.141.126] (unknown [10.30.44.25])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8AF87180035E;
	Fri, 12 Sep 2025 06:02:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc5,
 upstream-mainline, e59a0391)
Date: Fri, 12 Sep 2025 06:02:12 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <10896.125091202021400241@us-mta-250.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zVGkhXW1ZMmndqUceOQc2V_3dpGBeu3I734hxxj8BpE_1757656933
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 's390-6.17-4' of git://git.kernel.org/pub/scm=
/linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2034781651

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2034781651_x86_64_kernel_kcidb_tool_19560911_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2034781651_x86_64_kernel-debug_kcidb_tool_19561861_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [aarch64, ppc64le, s390x, x86_64, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64, x86_64]
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

