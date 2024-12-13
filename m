Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73F18A6BC
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734070333; cv=none; b=QTtlWVdQkUQQ5KkgqFQo0nZbfugbag7Atft0m3CopnDbp3dz0MqJAzXUnlKYirjV6CstaLs7lqEJ98bSnIueiIb8iAxhE0Zhvzs0Gy4/i0UlktaVmoyeAj1Ep1e9svAxitEnyOLIIMUj8gtmcPvQwRgq5KTg9grmDQntmbabfFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734070333; c=relaxed/simple;
	bh=kZhXDLcnmXL3xqSG1sDK7w/e+lNVtrTFe4aJ+f8D1dg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BZp1etn9SqceWcsVM1M9ygyiqKvO/MghCgyYJ99Bz6drF8HVb1MFBKmQgCzgWJaUan5ARwV0WRxNEvi3uhaI5vSF+WlzF7QsONOOB57TZt91qU+KN3gvOlRiJ3owY4AwCB9sjqKk345Oudj5KT8itxmyRAKKMENvIyVtPM4t6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CPK3F9AJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CPK3F9AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734070327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R+C+y8A8emyaIUPtnrXgR/2Uuy2QHivJULLPY0BX9Iw=;
	b=CPK3F9AJrpnajY7MCNBISU8VnP8UI8BCf/uSQ1/wZjGiyyfbf0KoPJRsIynoWiWnKn2rNE
	7enlDSaFdwnzmkhkShZbIU9v0Nl1tKXxvaZf3ByKhUXGjqDrdTTMUZhZKjqAMoFeYdeAbL
	VwYF4kFJOWoAjuNktV9AUqku/bkkaN4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-en0hhhwZPmamcPJsta6zDQ-1; Fri,
 13 Dec 2024 01:12:06 -0500
X-MC-Unique: en0hhhwZPmamcPJsta6zDQ-1
X-Mimecast-MFC-AGG-ID: en0hhhwZPmamcPJsta6zDQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7823D1956089
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 06:12:05 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 221FC1956089;
	Fri, 13 Dec 2024 06:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc2,
 upstream-mainline, f932fb9b)
Date: Fri, 13 Dec 2024 06:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <66464.124121301120600331@us-mta-213.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nx_FHQIUIkzrhzo8vqny8xZha9F9ZvrYN5QYX_9OD3c_1734070325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.13-rc2-ksmbd-server-fixes' of git://git.s=
amba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1586963248

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1586963248-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1586963248-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1586963248-x86_64-kernel
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

