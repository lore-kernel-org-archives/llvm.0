Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DE23B0
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737738569; cv=none; b=bU7K15xo/y+n/RQlWB+eZ3epKTdSD1wjbunzgU9jANHY9kr4Q+fXeLr+u+K6nFu99B4SaJM+dUpWh+ey2G0gzIuP0+PoxsocXi67GELWSnADaGOCaStJRlz0di6bLvTMFfHerrzibBeJ0P4E6i5AkrTC4us+uf0vs2+Y3zvn7GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737738569; c=relaxed/simple;
	bh=0V1RhQIzxLz557lqsrFUasI3dpksdT7hiqRwP6q6X5Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lT7n4LWgk9jgUqup8iBD+MteDASb0UKst43NQIXGms6MFjeaT2yz64mEj9V50kj5BU/YWbWORYc448O54G9ZsG7qp3WPHHb5WYcONBDQdb1Li3UdPBqh4E9TYDDG9H3+zBNb3LE9xzqSOcKdJS0zMLOAF5MuXLLYq/QaWKwGM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LPNiyiPZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LPNiyiPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737738565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EWfeEtqQkH0XaBwfC4x1Y8BORG78PXOvz9cO9jVWvXM=;
	b=LPNiyiPZFsY94VmOe0KhUg02HOH7ytYw4uUtbxb/pECPQ+6pXpUmHqudSIwopkZFAu7WZN
	va/3Z0uMkvZ3ocsHLjIEpBCU3kCF5I73QmMNe9JtTxYRFV4MwyALziXbm+38CnpXS1v1Ne
	blKXwSph8T580+1zn7dvspnhA3q/qq8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-FgrBlInKOsmesWesT7FWsw-1; Fri,
 24 Jan 2025 12:09:20 -0500
X-MC-Unique: FgrBlInKOsmesWesT7FWsw-1
X-Mimecast-MFC-AGG-ID: FgrBlInKOsmesWesT7FWsw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E2601A16A0E
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 15:12:03 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1778A195608A;
	Fri, 24 Jan 2025 15:12:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 113691ce)
Date: Fri, 24 Jan 2025 15:12:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <44070.125012412092001535@us-mta-13.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7nDwM3Ul2DyBQvTQGTiSJD5V5iOeDHfTWna0yDrYJm8_1737738558
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_tdx_for_6.14-rc1' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1639772980

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1639772980-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1639772980-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1639772980-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

