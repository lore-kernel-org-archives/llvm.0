Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682F155A52
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 20:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737404587; cv=none; b=nbXEtynI+BCols+ySHeLuBWlGwc7NOfs2K+H6TKk/bw19BoXjp7JPUt5tMmHEsGQNfLIsWU3VOiH8DH/Io4UcwxSl5ah40fbMmcQUbPyUtHFWgzGJ195ImRkQT3RJ6iZQAnyOoT/U6Go4kQr4wYMqLqdCfXFgRf6VT86IaxremE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737404587; c=relaxed/simple;
	bh=sWGU9EzkH+PnQWrNBHEuutw+XTADzS0GHcDE7JqHs28=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lhdPOrtAP5UoL4PrZ8owb0oE5YIukzczovLDhvekpRRcfvG32jNTVOkcHMwv2zFaaYHlMqPmlbMTa8JgbJRlyES0lkmIt5MYUVKD+FChrPFzq8qL46h0zlBMmtizWWvZKTdry9KoRkEDqfWQsWLPk1EaWO6RmkUy4Nhn3muZrXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vd0yYfWH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vd0yYfWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737404585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ebVPZOiDoovJrkwrx04k73kQkSr19Lw8ixTIknHNmVU=;
	b=Vd0yYfWHvSqMI4sTVsHwHoAxejeUKY3M8ZcwGzNQQN9xxmtPVA8QeiXURvEct6tKrFIiNy
	og3/6CT4IgATtJfKHRDgOSG92FjDhnxRqr4V9Id1ZzMeffiHenV+N4VgMb1KG8VR4JX670
	4rUyx6tZAGZaOkw/t/3jXliKQtIbCs4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-Gm5T9_X7MLarb5H33SZn8w-1; Mon,
 20 Jan 2025 15:23:03 -0500
X-MC-Unique: Gm5T9_X7MLarb5H33SZn8w-1
X-Mimecast-MFC-AGG-ID: Gm5T9_X7MLarb5H33SZn8w
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E34981956050
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 20:23:02 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 813CB3003E7F;
	Mon, 20 Jan 2025 20:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 100ceb48)
Date: Mon, 20 Jan 2025 20:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <32660.125012015230300829@us-mta-682.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Z78_FnHHe-jblyGkbjFyZaBPnSBlC7iyECxUfGxZK4_1737404583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfs-6.14-rc1.mount.v2' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1633193912

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1633193912-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1633193912-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1633193912-x86_64-kernel
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

