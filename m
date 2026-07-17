Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B873328FA
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256133; cv=none; b=Vc3ivBZTDgcVUCwhE65JVdWiN1LC1FpvkqnU46b0fdJNaJqKQJQhArO/zqymRS8r1gT+dbPVWZ/ombaJXGeefMIeBP+myrDLP+KZxmFDpu27h/uE/Uq5/8KtpCzODt0rJzYA/1AGxJ3QyYEnNWpBYEIilFUMfinUzHaXnGBVHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256133; c=relaxed/simple;
	bh=BNqlJg16J7c6xJv4BSA8oJE6V0qKRizhJVG9cvDNFbc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=o2vR9EDPx51sU12INneUN7ccVhcEHR2cDV57eCGI2/HUFaMAjpdygHAc+6Af5mnn5YnY2ainOKzouCCjatmjBqZqz4AxQcu7ORASD3D8HZKyCHhJQsluyM/lVN98fx2UjfHb6T9zKtD0k4YeQ8+CZ9UC8Rh/2j+0myMF/8ewzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JhOzt2S5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JhOzt2S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784256130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BhzZB/BxIL6V19JTQlt6MOGHiLahQ6tzYtlP04nj2nc=;
	b=JhOzt2S5+JznfOmNxs5Ffpo2mzdscxsSOQ/7S3etDEsaEhMEl8j9/9CpnVGvpjhqH0g2Cq
	9Yn47v3CrQTahXApKWtsrLhVrMolPC/MfnFMi/zCu/+OQwB+Cs//MKcN+iKoJ9cijbkrtK
	ml0zPl/KaV2m2X0HzRmwlMkcFb+u2og=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-eBw12XgsMWS_lCDYQRWD-g-1; Thu,
 16 Jul 2026 22:42:08 -0400
X-MC-Unique: eBw12XgsMWS_lCDYQRWD-g-1
X-Mimecast-MFC-AGG-ID: eBw12XgsMWS_lCDYQRWD-g_1784256127
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A55F21955E9F
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 02:42:07 +0000 (UTC)
Received: from [172.20.159.80] (unknown [10.30.44.85])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1E457180029A;
	Fri, 17 Jul 2026 02:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 9 of 97): Test report for master
 (7.2.0-rc3, upstream-mainline, 6f5156d7)
Date: Fri, 17 Jul 2026 02:42:06 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <27648.126071622420800157@us-mta-25.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yCQmPXnVeRv1CyH-AognncKrsEbO6eMj2SGm9w5HxzU_1784256127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'pm-7.2-rc4' of git://git.kernel.org/pub/scm/=
linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2682571473

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2682571473_aarch64_kernel_kcidb_tool_21658469_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2682571473_x86_64_kernel_kcidb_tool_21658465_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [ppc64le]
    /distribution/command [ppc64le]
    /test/misc/machineinfo [ppc64le]
    Boot test [ppc64le]
    CKI/restraint [ppc64le]
    Reboot test [ppc64le]
    SELinux Custom Module Setup [ppc64le]
    selinux-policy: serge-testsuite [ppc64le]


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

